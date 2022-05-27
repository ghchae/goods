let toJson = function(form) {
    let unindexed_array = $(form).serializeArray();
    let json = {};
    let addProps = function(parent, prop, value) {
        let delim = prop.indexOf('.');
        if (delim != -1) {
            let propName = prop.substr(0, delim);
            let currentObject = parent[propName];
            if (currentObject === undefined) {
                currentObject = {};
                parent[propName] = currentObject;
            }
            addProps(currentObject, prop.substr(delim + 1), value);
        } else {
            if ($.isArray(value)) {
                parent[prop] = value.join(",");
            } else {
                parent[prop] = value;
            }
        }
    };
    let keyMap = {};
    $.map(unindexed_array, function(n, _v) {
        let name = n.name;
        let value = n.value.trim();
        if ($("input[name='" + name + "']").hasClass("toDate")) {
            //value = moment(value).toDate();
        }
        if (keyMap[name]) {
            if ($.isArray(keyMap[name])) {
                keyMap[name].push(value);
            } else {
                keyMap[name] = [keyMap[name], value];
            }
        } else {
            keyMap[name] = value;
        }
    });
    $.map(keyMap, function(value, name) {
        if (name.search('\\.') > -1) {
            addProps(json, name, value);
        } else {
            if ($.isArray(value)) {
                json[name] = value.join(",");
            } else {
                json[name] = value;
            }
        }
    });
    return json;
};