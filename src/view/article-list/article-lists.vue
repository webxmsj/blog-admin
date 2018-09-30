<template>
  <div>
    <Table :columns="columns2" :data="data4"></Table>
  </div>
</template>

<script>
import expandRow from './table-expand.vue'
export default {
  components: {
    expandRow
  },
  data () {
    return {
      columns2: [
        {
          type: 'expand',
          width: 50,
          render: (h, params) => {
            return h(expandRow, {
              props: {
                row: params.row
              }
            })
          }
        },
        {
          title: 'Id',
          key: 'id',
          width: 100
        },
        {
          title: '名称',
          key: 'name',
          width: 150
        },
        {
          title: '类别',
          key: 'category'
        },
        {
          title: '描述',
          key: 'description',
          width: 300
        },
        {
          title: '封面',
          key: 'cover',
          width: 150,
          render: (h, params) => {
            return h('img', {
              attrs: {
                src: params.row.cover
              }
            })
          }
        },
        {
          title: '发布时间',
          key: 'releasetime',
          width: 150,
          sortable: true
        },
        {
          title: '修改时间',
          key: 'modifytime',
          width: 150,
          sortable: true,
          sortMethod: function (a, b, type) {
            console.log(a, b, type)
          }
        },
        {
          title: '查看数',
          key: 'viewnumber',
          width: 100,
          sortable: true
        },
        {
          title: '点赞数',
          key: 'thumbnumber',
          width: 100,
          sortable: true
        },
        {
          title: '操作',
          key: 'action',
          width: 160,
          render: (h, params) => {
            return h('div', [
              h(
                'Button',
                {
                  props: {
                    type: 'text',
                    size: 'small'
                  }
                },
                '预览'
              ),
              h(
                'Button',
                {
                  props: {
                    type: 'text',
                    size: 'small'
                  }
                },
                '编辑'
              ),
              h(
                'Button',
                {
                  props: {
                    type: 'text',
                    size: 'small'
                  }
                },
                '删除'
              )
            ])
          }
        }
      ],
      data4: [
        {
          id: 0,
          name: '文章一',
          category: '美文',
          tag: 'js,css,vue',
          description: '这篇文章主要描述了……',
          cover: 'https://img.zcool.cn/community/014a765b2ca403a8012034f72498e1.png@1280w_1l_2o_100sh.webp',
          releasetime: '2018-09-30 12:00',
          modifytime: '2018-09-30 16:00',
          viewnumber: 1000,
          thumbnumber: 650
        }, {
          id: 1,
          name: '文章二',
          description: '这篇文章主要描述了……',
          cover: 'https://img.zcool.cn/community/014a765b2ca403a8012034f72498e1.png@1280w_1l_2o_100sh.webp',
          releasetime: '2018-09-30 13:00',
          modifytime: '2018-09-30 18:00',
          viewnumber: 1200,
          thumbnumber: 450
        }
      ]
    }
  }
}
</script>

<style lang="less">
.ivu-table-cell{
  overflow: hidden;
  img{
    display: block;
    width: 100%;
    height: auto;
  }
}
</style>
