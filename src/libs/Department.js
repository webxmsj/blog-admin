/*
* @Author: mengxiaofei
* @Date:   2018-10-29 19:13:43
* @Last Modified by:   mengxiaofei
* @Last Modified time: 2018-10-29 19:14:07
*/
class Department {
  constructor (type) {
    this.type = type
  }
}
class EditorDepartment extends Department{
  constructor (el, options) {
    super('editor')
    this.options = options
    this.init()
  }
  init () {
    this.createToolBar(this.options)
  }
  createToolBar(options){
    // var baseToolBar = [{
    //   name: 'bold',
    //   action: Simplemde.toggleBold,
    //   className: 'fa fa-bold',
    //   title: '加粗'
    // }, {
    //   name: 'italic',
    //   action: Simplemde.toggleItalic,
    //   className: 'fa fa-italic',
    //   title: '斜体'
    // }, {
    //   name: 'heading',
    //   action: Simplemde.toggleHeadingSmaller,
    //   className: 'fa fa-header',
    //   title: '标题'
    // }, {
    //   name: 'code',
    //   action: Simplemde.toggleCodeBlock,
    //   className: 'fa fa-code',
    //   title: '代码块'
    // }, {
    //   name: 'image',
    //   action: () => {
    //     this.insertImg()
    //   },
    //   className: 'fa fa-picture-o',
    //   title: '图片'
    // }, {
    //   name: 'preview',
    //   action: Simplemde.togglePreview,
    //   className: 'fa fa-eye no-disable',
    //   title: '预览'
    // }]
    // TODO 合并两个对象数组
  }
}