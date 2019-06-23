function onKeyPressBlockNumbers(value) {
    reg = /^\-?([1-9]\d*|0)(\.\d?[1-9])?$/;
    if (!reg.test(value)) {
        alert("لطفا فقط از فرمت اعداد استفاده نمایید");
        return false;
    }
    return reg.test(value);
}