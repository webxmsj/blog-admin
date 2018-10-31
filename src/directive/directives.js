import { on } from '@/libs/tools'
import { MdEditor } from '@/libs/Factory'

const directives = {
  /**
   * 拖拽指令 v-draggable="options"
   * options = {
   *  trigger: /这里传入作为拖拽触发器的CSS选择器/,
   *  body:    /这里传入需要移动容器的CSS选择器/,
   *  recover: /拖动结束之后是否恢复到原来的位置/
   * }
   */
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
  /**
   * textarea 转MarkDown 编辑器指令 v-mdeditor="options"
   * options = {
   *   toolbar: Boolean or Array, false // 隐藏 toolbar [] // 添加自定义toolbar 按照 simplemde的添加规则
   *   spellChecker: false,  // 是否开启拼写检查
   *   forceSync: true,
   *   width: 600, // 编辑器的宽度
   *   height: 300 // 编辑器的高度
   *   ……  其他参数同 simplemde options
   * }
   */
  mdeditor: {
    inserted: (el, binding, vnode) => {
      let options = binding.value
      let editor = new MdEditor(el, options)
      if (options.width && options.height) {
        editor.setSize(options.width, options.height)
      }
      editor.bindEvent(vnode.context, vnode.data.on)
    }
  }
}

export default directives
