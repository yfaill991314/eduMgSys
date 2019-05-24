Ext.define('app.view.teaMyCourse.teaCourseInfo', {
    extend: 'Ext.tab.Panel',
    xtype: 'view-teaMyCourse-teaCourseInfo',
    requires: [
        "app.view.teaMyCourse.teaCourseBaseInfo",
        "app.view.teaMyCourse.currentStudentList"
    ],
    config: {

    },

    constructor: function (config) {
        var me = this;
        config = config || {};
        Ext.applyIf(config, me.config);
        this.callParent(arguments);
    },
    initComponent: function () {
        var me = this;
        Ext.apply(me, {
            items: [
                {
                    title: '基础信息',
                    glyph: 'xf0c0@FontAwesome',
                    itemId: 'teaCourseBaseInfo_id',
                    height: '100%',
                    width: '100%',
                    border: true,
                    autoScroll: true,
                    xtype: 'view-teaMyCourse-teaCourseBaseInfo',
                    autoFill: true,
                    bodyStyle: 'overflow-x:hidden; overflow-y:scroll'
                },{
                    title: '学生信息',
                    glyph: 'xf0c0@FontAwesome',
                    itemId: 'currentStudentList_id',
                    height: '100%',
                    width: '100%',
                    border: true,
                    autoScroll: true,
                    xtype: 'view-teaMyCourse-currentStudentList',
                    autoFill: true,
                    bodyStyle: 'overflow-x:hidden; overflow-y:scroll'
                }
            ]
        });
        me.callParent(arguments);
    }
});
