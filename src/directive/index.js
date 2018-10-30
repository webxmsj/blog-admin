import directive from './directives'

const importDirective = Vue => {
  let keys = Object.keys(directive)
  keys.forEach(item => {
    Vue.directive(item, directive[item])
  })
}

export default importDirective
