/*
* @Author: mengxiaofei
* @Date:   2018-10-17 14:51:59
* @Last Modified by:   mengxiaofei
* @Last Modified time: 2018-10-17 16:36:55
*/
import mqtt from 'mqtt'
import { isType } from '../tools'
class Mqtt {
  constructor (options) {
    this._setting = {
      name: 'asdf',
      url: ''
    }
    this.subscribes = {}
    Object.assign(this._setting, options)
    this.client = mqtt.connect(this._setting.url)
    this.addHook()
  }

  addHook () {
    this.client.on('connect', function () {
      console.log('连接成功')
    })
    this.client.on('message', (topic, payload) => {
      if (this.subscribes[topic]) {
        this.subscribes[topic](payload.toString())
      }
    })
  }

  addSubscribe (items) {
    if (isType(items) === 'object') {
      var keysarr = Object.keys(items)
      keysarr.forEach(key => {
        this.subscribes[key] = items[key]
        this.client.subscribe(key, function (err, res) {
          if (err) {
            console.log(err)
          } else {
            console.log(`订阅成功 %c${key}`, 'color:#fff;background-color: green')
          }
        })
      })
    }
  }

  getSubscribes () {
    return this.subscribes
  }

  removeSubscribe (items) {
    if (Array.isArray(items)) {
      items.forEach((item) => {
        this.client.unsubscribe(item, function (err, res) {
          if (err) {
            console.log(err)
          } else {
            console.log(`取消订阅成功 %c${item}`, 'color:#fff;background-color: green')
          }
        })
        delete this.subscribes[item]
      })
    } else {
      delete this.subscribes[items]
      this.client.unsubscribe(items, function (err, res) {
        if (err) {
          console.log(err)
        } else {
          console.log(`取消订阅成功 %c${items}`, 'color:#fff;background-color: green')
        }
      })
    }
  }

  disConnect () {
    this.client.end()
  }
}

export default Mqtt
