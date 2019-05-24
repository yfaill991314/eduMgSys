
Ext.define('app.view.teaMyCourse.teaCourse', {
    id: "teaCourse",
    extend: 'Ext.grid.Panel',
    xtype: 'view-teaMyCourse-teaCourse',
    requires: [
    "app.view.teaMyCourse.teaCourseInfo"],
    padding: "10px 20px 0 20px",
    config: {
        tabtitle:''
    },
    constructor: function (config) {
        var me = this;
        config = config || {};
        Ext.applyIf(config, me.config);
        this.callParent(arguments);
    },
    initComponent: function () {
        var me = this;

        var entityCourseStore = Ext.create('Ext.data.Store', {
            id: 'entityCourseStore',
            autoLoad: true,
            // fields: ['stuName', 'age', 'sex'],
            pageSize: 15, // 每页的条目数量
            proxy: {
                type: 'ajax',
                url: 'entityCourse/findTeaCourse',
                reader: {
                    type: 'json',
                    rootProperty: 'rows',
                    totalProperty:"total"
                }
            }
        });

        var paramStore = Ext.create('Ext.data.Store', {
            fields: ['name'],
            autoLoad: true,
            data: [
                {'name': '课程编号', 'value': 'id'},
                {'name': '课程名称', 'value': 'couName'},
                {'name':'状态','value':'status'}
            ]
        });

        var statusStore = Ext.create('Ext.data.Store', {
            fields: ['name', 'value'],
            autoLoad: true,
            data: [
                {'name': '待选课', 'value': '待选课'},
                {'name': '正在授课', 'value': '正在授课'},
                {'name': '已结课', 'value': '已结课'},
                {'name': '已评分', 'value': '已评分'},
            ]
        });

        Ext.apply(me, {
            tbar: {
                layout: 'column',
                scope: me,
                items: [
                    {
                        xtype: 'toolbar',
                        columnWidth: 1,
                        scope: me,
                        itemId: 'search',
                        style:'border: 1px solid blue;background:#AFCEE3;',
                        items: [
                            {
                                xtype: 'button',
                                accessUrl: 'editAccount',
                                text: '结课', scope: me, glyph: 'xf044@FontAwesome',
                                itemId: 'bt_edit',
                                handler: function (btn) {
                                    var selectData = me.getSelectionModel().getSelection();
                                    if (selectData.length != 1) {
                                        Ext.Msg.alert('温馨提示', '请选择一条操作数据');
                                        return;
                                    }
                                    me.endCourse(selectData[0]);
                                }
                            },
                            {
                                xtype: 'button',
                                text: '查看课程表',
                                scope: me,
                                glyph: 'xf002@FontAwesome',
                                itemId: 'bt_find',
                                handler: function () {
                                    var date = new Date();
                                    var time = date.getTime();
                                    Ext.create("Ext.window.Window", {
                                        title: '课程基本信息',
                                        modal: true,
                                        layout: 'fit',
                                        width: '100%',
                                        height: '100%',
                                        items: [
                                            {
                                                autoScroll: true,
                                                autoFill: true,
                                                height: '100%',
                                                width: '100%',
                                                xtype: "panel",
                                                html: '<img src="gradeMg/findTeaClaImg?time=' + time + '"/>',
                                                listeners: {}
                                            }]
                                    }).show();
                                }
                            },
                            {
                                xtype: 'button',
                                text: '课程详情',
                                scope: me,
                                glyph: 'xf002@FontAwesome',
                                itemId: 'course_info',
                                handler: function (btn) {
                                    var selectData = me.getSelectionModel().getSelection();
                                    if (selectData.length != 1) {
                                        Ext.Msg.alert('温馨提示', '请选择一条操作数据');
                                        return;
                                    }
                                    me.courseInfo(selectData[0]);
                                }
                            },
                            '->',
                            {
                                xtype: 'combobox',
                                emptyText: '请选择',
                                store: paramStore,
                                editable: false,
                                displayField: 'name',
                                valueField: 'value',
                                labelWidth: 60,
                                width: 200,
                                itemId: 'searchCom',
                                listeners: {
                                    change: function(){
                                        //combobox显示值
                                        var searchCom = me.queryById("searchCom").getRawValue();
                                        if(searchCom=="状态"){
                                            Ext.getCmp("teaCourse").queryById('searchContent').setHidden(true);
                                            Ext.getCmp("teaCourse").queryById('choosestatus').setHidden(false);
                                        }else {
                                            Ext.getCmp("teaCourse").queryById('searchContent').setHidden(false);
                                            Ext.getCmp("teaCourse").queryById('choosestatus').setHidden(true);
                                        }
                                    }
                                }
                            },
                            {
                                xtype: 'textfield',
                                emptyText: '请输入',
                                labelWidth: 60,
                                width: 220,
                                itemId: 'searchContent'
                            },
                            {
                                xtype: 'combobox',
                                emptyText: '请选择',
                                store: statusStore,
                                hidden:true,
                                editable: false,
                                displayField: 'name',
                                valueField: 'value',
                                labelWidth: 60,
                                width: 220,
                                itemId: 'choosestatus'
                            },
                            {
                                xtype: 'button', text: '搜索', scope: me, glyph: 'xf002@FontAwesome',
                                handler: function () {
                                    var searchCom = me.queryById("searchCom").getValue();
                                    if (searchCom=="status") {
                                        var searchContent = me.queryById("choosestatus").getValue();
                                    }else {
                                        var searchContent = me.queryById("searchContent").getValue();
                                    }
                                    var params = {};
                                    params[searchCom] = searchContent;
                                    me.store.load({
                                        params:params
                                    });
                                }
                            },
                            {
                                xtype: 'button', text: '重置', scope: me, glyph: 'xf0e2@FontAwesome',
                                handler: function () {
                                    me.query("#searchCom")[0].setValue(null);
                                    me.query("#searchContent")[0].setValue(null);

                                }
                            }
                        ]
                    }
                ]
            },
            border: true,
            store: entityCourseStore,
            title: me.config.tabtitle,
            columnLines: true,
            closable: true,
            viewConfig: {
                enableTextSelection: true
            },
            columns: [
                {text: '课程id', dataIndex: 'id', width: '10%', align: 'center'},
                {text: '课程名称', dataIndex: 'couName', width: '14%', align: 'center'},
                {text: '上课地点', dataIndex: 'location', width: '15%', align: 'center'},
                {text: '开始日期', dataIndex: 'strDate', width: '10%', align: 'center'},
                {text: '结束日期', dataIndex: 'endDate', width: '10%', align: 'center'},
                {text: '星期', dataIndex: 'week', width: '10%', align: 'center'},
                {text: '时间', dataIndex: 'claTime', width: '10%', align: 'center'},
                {text: '授课教师', dataIndex: 'tName', width: '10%', align: 'center'},
                {text: '课程状态', dataIndex: 'status', width: '10%', align: 'center'},

            ],
            listeners: {},
            dockedItems: [
                {
                    xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    displayInfo: true,
                    store: entityCourseStore
                }
            ]


        });
        me.callParent(arguments);
    },


    endCourse: function (selectData) {
        Ext.Ajax.request({
            url: 'gradeMg/endCourse',
            params: {'id': selectData.get('id')},
            method: 'POST',
            success: function (response, options) {
                var response = JSON.parse(response.responseText);
                if (response.success) {
                    var result = response.result;
                    Ext.getCmp("teaCourse").store.reload();
                    Ext.Msg.alert("系统提示", result);
                } else {
                    Ext.Msg.alert("系统提示", response.message);
                }

            },
            failure: function (response) {
                Ext.Msg.alert("系统提示", "请求超时");
            }
        });
    },
    //详情窗口
    courseInfo:function (selectData) {
        Ext.create("Ext.window.Window", {
            title: '课程信息',
            modal: true,
            layout: 'fit',
            width: '90%',
            height: '90%',
            items: [
                {
                    autoScroll: true,
                    autoFill: true,
                    height: '100%',
                    width: '100%',
                    // bodyPadding: 10,
                    xtype: "view-teaMyCourse-teaCourseInfo",
                    listeners: {
                        'afterrender': function (cmp) {
                            Ext.Ajax.request({
                                url: 'entityCourse/findEntityCourseInfo',
                                params: {'id': selectData.get('id')},
                                method: 'POST',
                                success: function (response, options) {
                                    var response = JSON.parse(response.responseText);
                                    if (response.success) {
                                        var result = response.result;
                                        var teaCourseBaseInfo = cmp.down('view-teaMyCourse-teaCourseBaseInfo');
                                        teaCourseBaseInfo.getForm().setValues(result);
                                        var teaCourseBaseInfoFields = teaCourseBaseInfo.getForm().getFields();
                                        teaCourseBaseInfoFields.each(function (field) {
                                            field.setReadOnly(true);
                                        });
                                        teaCourseBaseInfo.queryById('couName').columnWidth = 0.35;
                                        teaCourseBaseInfo.queryById('location').columnWidth = 0.35;
                                        teaCourseBaseInfo.queryById('tName').columnWidth = 0.35;
                                        Ext.each(teaCourseBaseInfo.query('button'), function (btn) {
                                            btn.hide();
                                        });

                                        cmp.down('view-teaMyCourse-currentStudentList').store.load({
                                            params: {
                                                courseId: selectData.get('id')
                                            }
                                        });
                                    } else {
                                        Ext.Msg.alert("系统提示", response.message);
                                    }

                                },
                                failure: function (response) {
                                    Ext.Msg.alert("系统提示", "请求超时");
                                }
                            });
                        }
                    }
                }],
        }).show();
    }

});
