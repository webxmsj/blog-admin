<template>
  <div>
    <p style="margin: 15px;">文章表</p>
    <Table :columns="columns3" :data="data3" border></Table>
  </div>
</template>

<script>
export default {
  data () {
    return {
      columns3: [{
        title: '编号',
        key: 'id',
        width: 80,
        fixed: 'left'
      }, {
        title: '父级id',
        key: 'parent_id',
        width: 120
      }, {
        title: '内容格式',
        key: 'post_format',
        width: 120
      }, {
        title: '发表者用户id',
        key: 'user_id',
        width: 120
      }, {
        title: '发布状态',
        key: 'post_status',
        width: 120
      }, {
        title: '评论状态',
        key: 'comment_status',
        width: 120
      }, {
        title: '是否置顶',
        key: 'is_top',
        width: 120
      }, {
        title: '是否推荐',
        key: 'recommended',
        width: 120
      }, {
        title: '查看数',
        key: 'post_hits',
        width: 80
      }, {
        title: '点赞数',
        key: 'post_like',
        width: 80
      }, {
        title: '评论数',
        key: 'comment_count',
        width: 80
      }, {
        title: '创建时间',
        key: 'create_time',
        width: 120
      }, {
        title: '更新时间',
        key: 'update_time',
        width: 120
      }, {
        title: '发布时间',
        key: 'published_time',
        width: 120
      }, {
        title: '删除时间',
        key: 'delete_time',
        width: 120
      }, {
        title: '文章标题',
        key: 'post_title',
        width: 120
      }, {
        title: '文章关键字',
        key: 'post_keywords',
        width: 120
      }, {
        title: '文章摘要',
        key: 'post_excerpt',
        width: 120
      }, {
        title: '转载文章的来源',
        key: 'post_source',
        width: 160
      }, {
        title: '文章内容',
        key: 'post_content',
        width: 120
      }, {
        title: '缩略图',
        key: 'thumbnail',
        width: 120
      }, {
        title: '扩展属性',
        key: 'more',
        width: 120,
        fixed: 'right'
      }],
      data3: [{
        id: 1
      }]
    }
  }
}
</script>

<style>

</style>
