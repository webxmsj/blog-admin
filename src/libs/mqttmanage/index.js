/*
* @Author: mengxiaofei
* @Date:   2018-10-17 14:56:03
* @Last Modified by:   mengxiaofei
* @Last Modified time: 2018-10-17 15:39:40
*/
import Mqtt from './handle'
export default {
  install (Vue, options) {
    Vue.prototype.$mqtt = new Mqtt(options)
  }
}
