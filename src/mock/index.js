import Mock from 'mockjs'
import { login, logout, getUserInfo } from './login'
import { getTableData, getDragList } from './data'
import { getFriendLinks, getDisplayStructure, getCategorys, getOriginalCategorys, queryAll } from './getdatas'

// 登录相关和获取用户信息
Mock.mock(/\/login/, login)
Mock.mock(/\/get_info/, getUserInfo)
Mock.mock(/\/logout/, logout)
Mock.mock(/\/get_table_data/, getTableData)
Mock.mock(/\/get_drag_list/, getDragList)
Mock.mock(/\/get_friend_links/, getFriendLinks)
Mock.mock(/\/get_display_structure/, getDisplayStructure)
Mock.mock(/\/get_categorys/, getCategorys)
Mock.mock(/\/get_original_categorys/, getOriginalCategorys)
Mock.mock(/\/query_all/, queryAll)
export default Mock
