<template>
  <div>
    <Table ref="selection" border :columns="columns" :data="datas"></Table>
    <Button @click="handleSelectAll(true)">全选</Button>
    <Button @click="handleSelectAll(false)">取消全选</Button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      columns: [{
        type: 'selection',
        width: 60,
        align: 'center'
      }, {
        title: 'id',
        key: 'id'
      }, {
        title: '内容',
        key: 'content'
      }, {
        title: '评论者',
        key: 'author'
      }, {
        title: '发表时间',
        key: 'createTime'
      }, {
        title: '状态',
        key: 'status',
        render: (h, params) => {
          return h('Select', [
            h('Option', {
              props: {
                value: 'passed'
              }
            }, '通过'),
            h('Option', {
              props: {
                value: 'refuse'
              }
            }, '拒绝')
          ])
        }
      }, {
        title: '引用人',
        key: 'referer'
      }, {
        title: '引用评论',
        key: 'referercontent'
      }],
      datas: [{
        id: 0,
        content: '一篇不错的文章',
        author: '小王',
        createTime: '2018-09-30',
        status: '通过',
        referer: '引用者',
        referercontent: '楼上所说挺好'
      }, {
        id: 1,
        content: '一篇不错的文章',
        author: '小王',
        createTime: '2018-09-30',
        status: '通过',
        referer: '引用者',
        referercontent: '楼上所说挺好'
      }]
    }
  },
  methods: {
    handleSelectAll (status) {
      this.$refs.selection.selectAll(status)
    }
  }
}
</script>
