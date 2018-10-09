<template>
  <div>
    <p style="margin: 15px;">分类文章对应表</p>
    <Table :columns="columns2" :data="data2"></Table>
  </div>
</template>

<script>
export default {
  data () {
    return {
      columns2: [{
        title: '编号',
        key: 'id'
      }, {
        title: '文章id',
        key: 'post_id'
      }, {
        title: '分类id',
        key: 'category_id'
      }, {
        title: '排序',
        key: 'list_order'
      }, {
        title: '状态',
        key: 'status'
      }],
      data2: [{
        id: 1,
        post_id: 1,
        category_id: 1,
        list_order: 1,
        status: '1|0'
      }]
    }
  }
}
</script>

<style>

</style>
