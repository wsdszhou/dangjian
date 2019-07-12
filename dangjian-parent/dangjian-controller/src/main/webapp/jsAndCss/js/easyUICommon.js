//用于格式化日期 
$.fn.datebox.defaults.formatter = function(date){
    var y = date.getFullYear();
    var M = date.getMonth()+1;
    var d = date.getDate();
    var hour = datetime.getHours() < 10 ? "0" + datetime.getHours()
            : datetime.getHours();
    var minute = datetime.getMinutes() < 10 ? "0"
            + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds() < 10 ? "0"
            + datetime.getSeconds() : datetime.getSeconds();
    return y+'/'+M+'/'+d+ " " + hour + ":" + minute + ":" + second;
};