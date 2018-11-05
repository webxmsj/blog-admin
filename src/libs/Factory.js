/*
* @Author: mengxiaofei
* @Date:   2018-10-29 19:13:43
* @Last Modified by:   mengxiaofei
* @Last Modified time: 2018-11-05 14:48:13
*/
import Simplemde from 'simplemde' // markdown 编辑器
export const MdEditor = class MdEditor {
  constructor (el, options) {
    this.options = options
    this.el = el
    this.baseToolBar = [{
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
    this.editor = null
    this.init()
  }
  init () {
    if (this.options.toolbar === false) {
      this.baseToolBar = false
    } else {
      this.createToolBar(this.options)
    }
    this.editor = new Simplemde(Object.assign(this.options, {
      element: this.el,
      toolbar: this.baseToolBar,
      renderingConfig: {
        codeSyntaxHighlighting: true
      }
    }))
  }

  createImgUpload () {
    // TODO 插入上传组件
    console.log('upload img')
  }

  createToolBar (options) {
    if (!Array.isArray(this.options.toolbar)) {
      return false
    }
    var selftool = this.options.toolbar.map(item => {
      return item.name
    })
    this.baseToolBar.forEach((item, index) => {
      let currentname = item.name
      if (selftool.indexOf(currentname) === -1) {
        if (this.options.toolbar[index]) {
          this.baseToolBar.push(this.options.toolbar[index])
        }
      }
    })
  }
  setSize (width, height) {
    var element = this.editor.codemirror.display.wrapper
    element.style.width = width + 'px'
    element.style.height = height + 'px'
    if (this.editor.gui.statusbar) {
      this.editor.gui.statusbar.style.width = width + 'px'
    }
    if (this.editor.gui.toolbar) {
      this.editor.gui.toolbar.style.width = width + 'px'
    }
  }
  bindEvent (context, events) {
    // 获得焦点事件
    if (events['on-focus']) {
      this.editor.codemirror.on('focus', () => {
        let html = this.gethtml()
        events['on-focus'].call(context, html)
      })
    }
    // 失去焦点事件
    if (events['on-blur']) {
      this.editor.codemirror.on('blur', () => {
        let html = this.gethtml()
        events['on-blur'].call(context, html)
      })
    }
    if (events['on-change']) {
      this.editor.codemirror.on('change', () => {
        let value = this.getvalue()
        events['on-change'].call(context, value)
      })
    }
  }
  gethtml () {
    return this.editor.markdown(this.editor.value())
  }
  getvalue () {
    return this.editor.value()
  }
}
