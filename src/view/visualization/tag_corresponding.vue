<template>
  <div>
    <p style="margin: 15px;">标签文章对应表</p>
    <Table :columns="columns" :data="data"></Table>
  </div>
</template>

<script>
import { queryall, getDisplayStructure } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  data () {
    return {
      columns: [],
      data: []
    }
  },
  beforeMount () {
    // 获取 标签表对应表显示字段结构
    getDisplayStructure('blog_tag_post').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data)
      } else {
        console.log('请求 getDisplayStructure 失败')
      }
    })
    // 获取原始的标签对应表数据
    queryall('blog_tag_post').then(res => {
      if (res.status === 200) {
        this.data = res.data
      } else {
        console.log('获取文章分类错误')
      }
    })
  }
}
</script>
