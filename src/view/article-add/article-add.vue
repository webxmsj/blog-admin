<template>
  <Tabs class="addarticle" value="markeditor" @on-click="tabChange">
    <TabPane label="MarkDown编辑器" name="markeditor">
      <MarkEditor @on-blur="getarticle"></MarkEditor>
      <Button type="primary" :loading="loading1" icon="ios-power" @click="pushArticle(0)">
        <span v-if="!loading1">发布</span>
        <span v-else>提交中……</span>
      </Button>
    </TabPane>
    <TabPane label="富文本编辑器" name="richeditor">
      <RichText></RichText>
      <Button type="primary" :loading="loading2" icon="ios-power" @click="pushArticle(1)">
        <span v-if="!loading2">发布</span>
        <span v-else>发布中……</span>
      </Button>
    </TabPane>
  </Tabs>
</template>

<script>
import MarkEditor from '@/components/markdown/markdown.vue'
import RichText from '@/components/editor/editor.vue'
export default {
  data () {
    return {
      name: 'asdf',
      loading1: false,
      loading2: false
    }
  },
  components: {
    MarkEditor,
    RichText
  },
  methods: {
    pushArticle (arg) {
      if (arg) {
        this.loading2 = true
      } else {
        this.loading1 = true
      }
      //  TODO push message
    },
    getarticle (value) {
      console.log(value)
    },
    tabChange (name) {
      console.log('你点击了' + name)
    }
  }
}
</script>

<style lang="less">
.addarticle{
  padding-bottom: 20px;
}
</style>
