<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 2018/12/5
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>试卷管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>

<div class="layui-fluid">

    <div class="layui-row">
        <%--试卷筛选--%>
        <form class="layui-form">

        </form>
    </div>

    <div class="layui-row">
        <div class="layui-table" id="TestPaperList" lay-filter="TestPaperList"></div>
    </div>

</div>
</body>
<%--头部工具栏--%>
<script type="text/html" id="toolbarstlb" lay-filter="toolbarTestPaperList">
    <div class="layui-btn-container">
        <s:hasPermission name="exam-paper-add">
            <button class="layui-btn layui-btn-sm" lay-event="addTestPaper">新增试卷</button>
        </s:hasPermission>

        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="testPaperCategorieManager">分类管理</button>
    </div>
</script>
<%--行内工具栏--%>
<script type="text/html" id="rowbar" lay-filter="rowbarTestPaperList">
    <s:hasPermission name="exam-paper-update">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="editTestPaperQuestion">编辑试题</a>
        <a class="layui-btn layui-btn-xs" lay-event="editTestPaperOption">配置选项</a>
    </s:hasPermission>

    <s:hasPermission name="exam-paper-delete">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteTestpaper">删除</a>
    </s:hasPermission>
</script>

<script type="text/html" id="checkboxTpl">
    <input type="checkbox" name="testPaperStatus" value="{{d.id}}" title="开启" lay-filter="testPaperStatus" {{ d.sjzt == 1 ? 'checked' : '' }}>
</script>

<script>
    layui.use(['layer', 'form', 'table', 'jquery', 'element'], function () {
        var layer = layui.layer
            , $ = layui.$
            , table = layui.table
            , element = layui.element
            , form = layui.form;

        // 试卷列表初始化
        table.render({
            elem: '#TestPaperList',
            url: '${pageContext.request.contextPath }/kszx/sjgl/loadTestPaperList',
            method: 'post',
            title: '试卷列表',
            page: true,
            toolbar: '#toolbarstlb',
            cellMinWidth: 80,
            cols: [[
                {type: 'numbers'},
                {field: 'id', title: 'ID', align: "center", hide: true},
                {field: 'sjbt', title: '标题', align: "center", width: 250},
                {field: 'baseInfo', title: '基本信息', align: "center", minWidth: 400},
                {field: 'status',title:'试卷状态',align:'center',width:100,templet: '#checkboxTpl'},
                {fixed: 'right', width: 250, align: 'center', title: '操作', toolbar: '#rowbar'}
            ]],
            parseData: function (res) {
                var rows = res.rows;
                var resarr = [];
                for (var i = 0; i < rows.length; i++) {
                    var tmpobj = {};
                    tmpobj.id = rows[i].id;
                    tmpobj.sjbt = rows[i].sjbt;
                    tmpobj.sjzt = rows[i].sjzt;
                    var sjlbmc = rows[i].sjlbmc;
                    var zjfs = "";
                    if (rows[i].zjfs == 1) {
                        zjfs = "固定试题考试";
                    } else {
                        zjfs = "随机试题考试";
                    }
                    tmpobj.zjfs = rows[i].zjfs;
                    tmpobj.baseInfo = sjlbmc + " | " + zjfs + " | " + "总分" + rows[i].sjzf + "分" + " | " + "共" + rows[i].stzs + "道题" + " | " + "限时" + rows[i].djsj + "分钟" + " | " + rows[i].kssj + "-" + rows[i].jssj;
                    resarr.push(tmpobj);
                }
                return {"code": 0, "data": resarr, "count": res.total}
            }
        });

        table.on("toolbar(TestPaperList)", function (obj) {
            switch (obj.event) {
                case 'addTestPaper':
                    layer.open({
                        type: 2,
                        title: "添加试卷",
                        shadeClose: false,
                        shade: 0.8,
                        area: ['100%', '100%'],
                        content: "${pageContext.request.contextPath }/kszx/sjgl/addTestPaper"
                    });
                    break;
                case 'testPaperCategorieManager':
                    layer.open({
                        type: 2,
                        title: "分类管理",
                        shadeClose: false,
                        shade: 0.8,
                        area: ['50%', '80%'],
                        content: "${pageContext.request.contextPath }/kszx/sjgl/testPaperCategorieManager"
                    });
            }
        });

        table.on("tool(TestPaperList)",function (obj) {
            console.log(obj.data);
            switch (obj.event) {
                case 'editTestPaperQuestion':
                    if(obj.data.zjfs == 1){
                        layer.open({
                            type: 2,
                            title: "编辑试题",
                            shadeClose: false,
                            shade: 0.8,
                            area: ['100%', '100%'],
                            content: "${pageContext.request.contextPath }/kszx/sjgl/fixChooseQuestion/"+obj.data.id,
                            end:function () {
                                table.reload("TestPaperList");
                            }
                        });
                    }else if(obj.data.zjfs == 2) {
                        layer.open({
                            type: 2,
                            title: "编辑试题",
                            shadeClose: false,
                            shade: 0.8,
                            area: ['100%', '100%'],
                            content: "${pageContext.request.contextPath }/kszx/sjgl/randomChooseQuestion/"+obj.data.id
                        });
                    }
                    break;
                case 'editTestPaperOption':
                    layer.open({
                        type:2,
                        title:"配置试卷",
                        shadeClose:false,
                        shade:0.8,
                        area:["100%","100%"],
                        content:"${pageContext.request.contextPath }/kszx/sjgl/editTestPaper/"+obj.data.id,
                        end:function () {
                            table.reload("TestPaperList");
                        }
                    });
                    break;
                case 'deleteTestpaper':
                    $.post("${pageContext.request.contextPath }/kszx/sjgl/deleteTestPaper",{data:JSON.stringify(obj.data)},function (data) {
                        table.reload("TestPaperList");
                    })
            }
        })

        form.on('checkbox(testPaperStatus)', function(obj){
            //layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
            if(obj.elem.checked){
                $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyTestpaperStatus?testpaperId="+this.value+"&status=1");
            }else {
                $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyTestpaperStatus?testpaperId="+this.value+"&status=0");
            }

        });

    })
</script>
</html>
