import { on } from '@/libs/tools'
import Simplemde from 'simplemde' // markdown 编辑器

const directives = {
  draggable: {
    inserted: (el, binding, vnode) => {
      let triggerDom = document.querySelector(binding.value.trigger)
      triggerDom.style.cursor = 'move'
      let bodyDom = document.querySelector(binding.value.body)
      let pageX = 0
      let pageY = 0
      let transformX = 0
      let transformY = 0
      let canMove = false
      const handleMousedown = e => {
        let transform = /\(.*\)/.exec(bodyDom.style.transform)
        if (transform) {
          transform = transform[0].slice(1, transform[0].length - 1)
          let splitxy = transform.split('px, ')
          transformX = parseFloat(splitxy[0])
          transformY = parseFloat(splitxy[1].split('px')[0])
        }
        pageX = e.pageX
        pageY = e.pageY
        canMove = true
      }
      const handleMousemove = e => {
        let xOffset = e.pageX - pageX + transformX
        let yOffset = e.pageY - pageY + transformY
        if (canMove) bodyDom.style.transform = `translate(${xOffset}px, ${yOffset}px)`
      }
      const handleMouseup = e => {
        canMove = false
      }
      on(triggerDom, 'mousedown', handleMousedown)
      on(document, 'mousemove', handleMousemove)
      on(document, 'mouseup', handleMouseup)
    },
    update: (el, binding, vnode) => {
      if (!binding.value.recover) return
      let bodyDom = document.querySelector(binding.value.body)
      bodyDom.style.transform = ''
    }
  },
  mdeditor: {
    inserted: (el, binding, vnode) => {
      let options = binding.value
      let context = vnode.context
      var events = vnode.data.on
      var customToolBar
      if (options.toolbar) {
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
      var editor = new Simplemde(Object.assign(options, {
        element: el,
        toolbar: customToolBar
      }))
      // 宽高修改
      var wraper = editor.codemirror.display.wrapper
      wraper.style.height = options.height + 'px'
      wraper.style.width = options.width ? options.width + 'px' : '100%'
      if (events['input'] || events['on-change']) {
        editor.codemirror.on('change', () => {
          let value = editor.value()
          events['on-change'] && events['on-change'].call(context, value)
        })
      }
      if (events['on-focus']) {
        editor.codemirror.on('focus', () => {
          events['on-focus'].call(context, editor.value())
        })
      }
      if (events['on-blur']) {
        editor.codemirror.on('blur', () => {
          let html = editor.markdown(editor.value())
          events['on-blur'].call(context, html)
        })
      }
    }
  }
}

export default directives
