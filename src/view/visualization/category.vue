<template>
  <div>
    <p style="margin: 15px;">文章分类表 (blog_category)</p>
    <Table :columns="columns1" :data="data1"></Table>
  </div>
</template>

<script>
import { getDisplayStructure, getOriginalCategorys } from '@/api/getdatas'
export default {
  data () {
    return {
      columns1: [],
      data1: []
    }
  },
  beforeMount () {
    // 获取 分类表显示字段结构
    getDisplayStructure('blog_category').then(res => {
      if (res.status === 200) {
        this.columns1 = res.data
      } else {
        console.log('请求 getDisplayStructure 失败')
      }
    })
    // 获取原始的分类数据
    getOriginalCategorys().then(res => {
      if (res.status === 200) {
        this.data1 = res.data
      } else {
        console.log('获取  getOriginalCategorys 失败')
      }
    })
  }
}
</script>

<style>

</style>
