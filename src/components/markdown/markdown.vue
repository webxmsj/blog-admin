<template>
  <div class="markdown-wrapper">
    <textarea ref="editor"></textarea>
    <Upload
      ref="editorupload"
      :show-upload-list="false"
      :format="['jpg','jpeg','png']"
      :max-size="2048"
      :before-upload="uploadImg"
      multiple
      type="drag"
      action=""
      style="display:none;">

    </Upload>
  </div>
</template>

<script>
import Simplemde from 'simplemde'
import 'simplemde/dist/simplemde.min.css'
import { uploadFile } from '@/api/getdatas'
export default {
  name: 'MarkdownEditor',
  props: {
    value: {
      type: String,
      default: ''
    },
    options: {
      type: Object,
      default: () => {
        return {}
      }
    },
    localCache: {
      type: Boolean,
      default: true
    }
  },
  data () {
    return {
      editor: null
    }
  },
  methods: {
    addEvents () {
      this.editor.codemirror.on('change', () => {
        let value = this.editor.value()
        if (this.localCache) localStorage.markdownContent = value
        this.$emit('input', value)
        this.$emit('on-change', value)
      })
      this.editor.codemirror.on('focus', () => {
        this.$emit('on-focus', this.editor.value())
      })
      this.editor.codemirror.on('blur', () => {
        let html = this.editor.markdown(this.editor.value())
        this.$emit('on-blur', html)
      })
    },
    uploadImg (file) {
      var that = this
      var reader = new FileReader()
      let formData = new FormData()
      reader.onload = function (e) {
        var img = new Image()
        img.src = e.target.result
        img.onload = function () {
          formData.append('file', file)
          uploadFile(formData).then(res => {
            that.inserIntoEditor(res.data.split('.')[0], 'http://img.bfrontend.com/' + res.data)
          })
        }
      }
      reader.readAsDataURL(file)
    },
    insertImg () {
      this.$refs.editorupload.handleClick()
    },
    inserIntoEditor (name, url) {
      var cm = this.editor.codemirror
      var text
      var startPoint = cm.getCursor('start')
      var endPoint = cm.getCursor('end')
      text = cm.getSelection()
      cm.replaceSelection('![' + name + '](' + text + url + ')')
      cm.setSelection(startPoint, endPoint)
      cm.focus()
    }
  },
  mounted () {
    var customToolBar
    if (this.options.toolbar) {
      customToolBar = [{
        name: 'bold',
        action: Simplemde.toggleBold,
        className: 'fa fa-bold',
        title: '加粗'
      }, {
        name: 'italic',
        action: Simplemde.toggleItalic,
        className: 'fa fa-italic',
        title: '斜体'
      }, {
        name: 'heading',
        action: Simplemde.toggleHeadingSmaller,
        className: 'fa fa-header',
        title: '标题'
      }, {
        name: 'code',
        action: Simplemde.toggleCodeBlock,
        className: 'fa fa-code',
        title: '代码块'
      }, {
        name: 'image',
        action: () => {
          this.insertImg()
        },
        className: 'fa fa-picture-o',
        title: '图片'
      }, {
        name: 'preview',
        action: Simplemde.togglePreview,
        className: 'fa fa-eye no-disable',
        title: '预览'
      }]
    } else {
      customToolBar = false
    }

    this.editor = new Simplemde(Object.assign(this.options, {
      element: this.$refs.editor,
      toolbar: customToolBar
    }))
    /**
     * 事件列表为Codemirror编辑器的事件，更多事件类型，请参考：
     * https://codemirror.net/doc/manual.html#events
     */
    this.addEvents()
    let content = localStorage.markdownContent
    if (content) this.editor.value(content)
  }
}
</script>

<style lang="less">
.markdown-wrapper{
  .editor-toolbar.fullscreen{
    z-index: 9999;
  }
  .CodeMirror-fullscreen{
    z-index: 9999;
  }
  .CodeMirror-fullscreen ~ .editor-preview-side{
    z-index: 9999;
  }
  .editor-preview{
    ul{
      padding-left: 15px;
    }
  }
}
</style>
