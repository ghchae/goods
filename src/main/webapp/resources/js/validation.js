let registerValidation = function (type, val) {
    switch (type) {
        case 'pwd' :
            return (!/^[a-zA-Z0-9`~!@#\$%\^&\*()\-_=\+[{\]}\\|;:'",<\.>/\?]{10,20}$/.test(val));
            break;
        case 'email' :
            return !(/^[0-9a-zA-Z-_\.]*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,5}$/.test(val));
            break;
        case 'phone' :
            return !(/^(01[016789]{1})[0-9]{7,8}$/.test(val));
    }
}