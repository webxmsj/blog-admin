<template>
  <div>
    <p style="margin: 15px;">文章分类表 (blog_category)</p>
    <Table :columns="columns" :data="data"></Table>
  </div>
</template>

<script>
import { getDisplayStructure, queryall } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  data () {
    return {
      columns: [],
      data: []
    }
  },
  beforeMount () {
    // 获取 分类表显示字段结构
    getDisplayStructure('blog_category').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data)
      } else {
        console.log('请求 getDisplayStructure 失败')
      }
    })
    // 获取原始的分类数据
    queryall('blog_category').then(res => {
      if (res.status === 200) {
        this.data = res.data
      } else {
        console.log('获取文章分类错误')
      }
    })
  }
}
</script>

<style>

</style>
