<template>
  <div>
    <p style="margin: 15px;">标签文章对应表</p>
    <Table :columns="columns5" :data="data5"></Table>
  </div>
</template>

<script>
export default {
  data () {
    return {
      columns5: [{
        title: 'id',
        key: 'id'
      }, {
        title: '标签id',
        key: 'tag_id'
      }, {
        title: '文章id',
        key: 'post_id'
      }, {
        title: '状态',
        key: 'status'
      }],
      data5: [{
        id: 1
      }]
    }
  }
}
</script>

<style>

</style>
