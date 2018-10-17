/*
* @Author: mengxiaofei
* @Date:   2018-10-17 14:51:59
* @Last Modified by:   mengxiaofei
* @Last Modified time: 2018-10-17 18:37:33
*/
import store from '@/store'
import mqtt from 'mqtt'
import { isType } from '../tools'
import { updateClientId } from '@/api/getdatas'
class Mqtt {
  constructor (options) {
    this._setting = {
      name: 'asdf',
      url: ''
    }
    this.subscribes = {}
    Object.assign(this._setting, options)
    this.clientId = 'bfrontend_' + Math.random().toString(36).substr(2, 10)
    this.client = mqtt.connect(this._setting.url, {
      clientId: this.clientId // 用户id
    })
    this.addHook()
  }

  addHook () {
    this.client.on('connect', () => {
      updateClientId({
        userId: store.state.user.userId,
        clientId: this.clientId
      }).then(res => {
        console.log('更新clientid成功')
      })
      console.log('连接成功')
      // 将 clientId 与用户对应 提交到数据库
    })
    this.client.on('message', (topic, payload) => {
      var current = this.subscribes[topic]
      if (current) {
        current['handler'].call(current['context'], payload.toString())
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
