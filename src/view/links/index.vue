<template>
  <div>
    <p>链接管理</p>
    <Table :loading="loading" :columns="columns" :data="datas"></Table>
  </div>
</template>
<script>
import { queryall, getDisplayStructure } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  data () {
    return {
      loading: true,
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    queryall('blog_link').then(res => {
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
        this.columns = convertSqlResToCol(res.data)
      } else {
        console.log(res)
      }
    })
  }
}
</script>
