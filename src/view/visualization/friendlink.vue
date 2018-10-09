<template>
  <Table :loading="loading" :columns="columns" :data="datas"></Table>
</template>
<script>
import { getFriendLinks, getDisplayStructure } from '@/api/getdatas'
export default {
  data () {
    return {
      loading: true,
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    getFriendLinks().then(res => {
      if (res.status === 200) {
        this.loading = false
        this.datas = res.data
      } else {
        console.log('表格数据加载失败')
      }
    })
    // 获取表结构
    getDisplayStructure('blog_link').then(res => {
      if (res.status === 200) {
        this.columns = res.data
      } else {
        console.log(res)
      }
    })
  }
}
</script>
