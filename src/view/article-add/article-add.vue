<template>
  <Tabs value="name1">
    <TabPane label="MarkDown编辑器" name="name1">
      <MarkEditor></MarkEditor>
    </TabPane>
    <TabPane label="富文本编辑器" name="name2">
      <RichText></RichText>
    </TabPane>
  </Tabs>
</template>

<script>
import MarkEditor from '@/components/markdown/markdown.vue'
import RichText from '@/components/editor/editor.vue'
export default {
  data () {
    return {
      name: 'asdf'
    }
  },
  components: {
    MarkEditor,
    RichText
  }
}
</script>

<style>

</style>
