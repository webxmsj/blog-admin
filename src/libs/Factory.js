/*
* @Author: mengxiaofei
* @Date:   2018-10-29 19:13:43
* @Last Modified by:   mengxiaofei
* @Last Modified time: 2018-11-07 16:46:30
*/
import { uploadFile } from '@/api/getdatas'

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
    this.upload = Upload.getInstance()
    this.upload.onUploadSuccess = this.inserIntoEditor.bind(this)
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
  insertImg () {
    this.upload.input.click()
  }
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
}

// 上传组件工具
export const Upload = class Upload {
  static getInstance () {
    if (!Upload.instance) {
      Upload.instance = new Upload()
    }
    return Upload.instance
  }
  constructor () {
    this.input = this.createInput()
    this.init()
  }
  init () {
    document.body.appendChild(this.input)
  }
  createInput () {
    var input = document.createElement('input')
    // input.style.display = 'none'
    input.type = 'file'
    input.name = 'upload'
    input.onchange = this.handleclick.bind(this)
    return input
  }
  handleclick (e) {
    var file = e.target.files[0]
    var reader = new FileReader()
    let formData = new FormData()
    reader.onload = e => {
      var img = new Image()
      img.src = e.target.result
      img.onload = () => {
        formData.append('file', file)
        uploadFile(formData).then(res => {
          var imgpath = 'http://img.bfrontend.com/' + res.data
          var name = res.data.split('.')[0]
          if (!this.onUploadSuccess) {
            console.error('请添加上传成功的处理方法')
          } else {
            this.onUploadSuccess(name, imgpath)
          }
        })
      }
    }
    reader.readAsDataURL(file)
  }
}
