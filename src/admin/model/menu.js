// +----------------------------------------------------------------------
// | ThinkJS-RABC [ 通用权限管理系统 ]
// +----------------------------------------------------------------------
// | Nanjing Digital Technology Co., Ltd.
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://www.51-health.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Devlin <Devlinheart@qq.com>
// +----------------------------------------------------------------------
// | Create: 2017-06-20
// +----------------------------------------------------------------------

'use strict';
/**
 * model
 */
export default class extends think.model.base {
    /**
     * 通过用户名称和密码查找登陆用户
     */
    async loadAllMenu(){
        return this.model("menu").where({delstatus:1,ismenu:0}).select();
    }
    /**
     * 根据用户获取当前菜单
     * @param {*} user  当前登陆用户
     */
    async loadMenuByUser(user){
        if(!think.isEmpty(user)){
            
        }
    }
    /**
     * 根据URL获取当前菜单
     * @param {*} user  当前登陆用户
     */
    async loadMenuByUrl(url){
        return this.model("menu").where({url:url,delstatus:1,ismenu:1}).find();
    }
    /**
     * 加载表格菜单
     * @param {*} pid 
     * @param {*} offset 
     * @param {*} limit 
     * @param {*} order 
     * @param {*} param 
     */
    async loadMenuTable(pid,offset,limit,order,param){
        let data = {total:0,rows:[]};
        let str_where = "1=1";
        if(!think.isEmpty(pid)){
            str_where += " and pid = "+pid+" ";
        }
        if(!think.isEmpty(param)){
            str_where += " and ( name like '%"+param+"%' or url like '%"+param+"%')";
        }      
        let countSql = await this.model("menu").where(str_where).count();
        if(countSql>0){
            data.total = countSql;
            let result = await this.model("menu").where(str_where).order("sort asc").limit(offset,limit).select();
            data.rows= result;
        }
        return data;
    }
    /**
     * 新增菜单
     * @param {*} menu 
     */
    async addMenu(menu){
        return this.model("menu").thenAdd(menu,{code:menu.code});
    }
    /**
     * 根据ID 查询菜单
     * @param {*} id 
     */
    async findMenuById(id){
        return await this.model("menu").where({id:id}).find();
    }
   /**
    * 删除菜单
    * @param {*} id 
    */
    async delMenu(id){
        return await this.model("menu").where({id:id}).delete();
    }
    /**
     * 更新排序
     * @param {*} data 
     */
    async sortMenu(data){
        return this.model("menu").updateMany(data);  
    }
    /**
     * 加载树结构菜单
     */
    async loadtree(){
        return await this.model("menu").field("id,pid,name").where({status:1,delstatus:1,ismenu:0}).select();
    }   
    /**
     * 加载操作权限菜单树
     */
    async loadrabctree(){
        return await this.model("menu").field("id,pid,name").where({status:1,delstatus:1}).order("sort asc").select();
    }
    /**
     * 编辑菜单
     * @param {*} data 菜单数据
     */
    async updateMenuById(data){
        let obj={};
        let menu = await this.model("menu").where({delstatus:1,id:["<>",data.id],code:data.code}).find();
        if(think.isEmpty(menu)){
            let bRet = await this.model("menu").where({id:data.id}).update(data);
            if(!think.isEmpty(bRet)){
                obj.result = 1;
            }
            else{
                obj.result = 0;
            }
        }
        else{
            obj.result = -1;
        }
        return obj;
    }
    /**
     * 通过数组主键查找菜单
     * @param {*} idArr 
     */
    async findMenuByIdArr(idArr){
        let menu = [];
        if(!think.isEmpty(idArr)){
            if(idArr.length>1){
                menu = await this.model("menu").where({id:["IN",idArr]}).select();
            }
            else{
                menu = await this.model("menu").where({id:idArr[0]}).select();
            }
        }
        return menu;
    }
}