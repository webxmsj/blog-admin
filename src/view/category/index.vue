<template>
  <div>
    <Table :columns="columns" :data="datas"></Table>
  </div>
</template>
<script>
export default {
  data () {
    return {
      columns: [{
        type: 'selection',
        align: 'center'
      }, {
        title: ''
      }],
      datas: [{

      }]
    }
  }
}
</script>
