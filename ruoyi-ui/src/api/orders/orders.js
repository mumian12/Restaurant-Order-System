import request from '@/utils/request'

// 查询orders列表
export function listOrders(query) {
  return request({
    url: '/orders/orders/list',
    method: 'get',
    params: query
  })
}

// 查询orders详细
export function getOrders(orderId) {
  return request({
    url: '/orders/orders/' + orderId,
    method: 'get'
  })
}

// 新增orders
export function addOrders(data) {
  return request({
    url: '/orders/orders',
    method: 'post',
    data: data
  })
}

// 修改orders
export function updateOrders(data) {
  return request({
    url: '/orders/orders',
    method: 'put',
    data: data
  })
}

// 删除orders
export function delOrders(orderId) {
  return request({
    url: '/orders/orders/' + orderId,
    method: 'delete'
  })
}
