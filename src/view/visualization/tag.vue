<template>
  <div>
    <p style="margin: 15px;">文章标签表</p>
    <Table :columns="columns4" :data="data4"></Table>
  </div>
</template>

<script>
export default {
  data () {
    return {
      columns4: [{
        title: '标签id',
        key: 'id'
      }, {
        title: '状态',
        key: 'status'
      }, {
        title: '是否推荐',
        key: 'recommended'
      }, {
        title: '标签文章数',
        key: 'post_count'
      }, {
        title: '标签名称',
        key: 'name'
      }],
      data4: [{
        id: 1
      }]
    }
  }
}
</script>

<style>

</style>
