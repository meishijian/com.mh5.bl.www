<template>
  <div class="goodslist">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>商品管理</el-breadcrumb-item>
      <el-breadcrumb-item>商品列表</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片 -->
    <el-card class="box-card">
      <el-button type="primary" plain @click="addGoods">添加商品</el-button>
      <br />
      <br />
      <!-- 表格 -->
      <el-table :data="goodsData" border style="width: 100%">
        <el-table-column type="index" width="50"></el-table-column>
        <el-table-column prop="goods_name" label="商品名称" width="100"></el-table-column>
        <el-table-column prop="price" label="商品价格" width="90"></el-table-column>
        <el-table-column prop="stock" label="商品数量" width="90"></el-table-column>
        <el-table-column prop="service" label="服务类型" width="90"></el-table-column>
        <el-table-column prop="bra_name" label="商品店铺" width="90"></el-table-column>
        <el-table-column prop="image" label="商品封面图片" width="130">
          <template slot-scope="scoped">
            <img :src="scoped.row.image" width="115px" alt srcset />
          </template>
        </el-table-column>
        <el-table-column prop="goods_swipe_pic" label="商品详情图片">
          <template slot-scope="scoped">
            <img
              :src="item"
              v-for="(item, index) in scoped.row.goods_swipe_pic"
              :key="index"
              width="80px"
              alt
              srcset
              style="margin-right:5px"
            />
          </template>
        </el-table-column>
        <el-table-column prop="goods_details_pic" label="商品轮播图片">
          <template slot-scope="scoped">
            <img
              :src="item"
              v-for="(item, index) in scoped.row.goods_details_pic"
              :key="index"
              width="80px"
              alt
              srcset
              style="margin-right:5px"
            />
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180">
          <template slot-scope="scoped">
            <el-button
              type="primary"
              icon="el-icon-edit"
              size="mini"
              @click="editGoods(scoped.row.id)"
            >编辑</el-button>
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              @click="delGoods(scoped.row)"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <br />
      <!-- 分页 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="goodsInfo.pagenum"
        :page-sizes="[2, 5, 10, 15]"
        :page-size="goodsInfo.pagesize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </el-card>
  </div>
</template>


<script>
export default {
  data() {
    return {
      // 商品数据
      goodsData: [],
      // 请求参数
      goodsInfo: {
        pagenum: 1, // 当前页码值
        pagesize: 2 // 每页显示多少条数据
      },
      // 总数
      total: 0
    };
  },
  created() {
    // 渲染商品数据
    this.getGoods();
  },
  methods: {
    // 删除
    async delGoods(row) {
      const confirmStr = await this.$confirm(
        "此操作将永久删除该商品, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      ).catch(error => error);
      // console.log(confirmStr);
      // 判断 如果取消
      if (confirmStr === "cancel") {
        return this.$message("已取消删除该商品");
      }
      const { data: res } = await this.$http.delete("/goods_list/" + row.id);
      // console.log(res);
      // 错误时
      if (res.code !== 200) return this.$message.error(res.error);
      // 成功时
      this.$message.success(res.message);
      // console.log(this.catData);
      // 删除该页面最后一条数据时，会出现没有数据 这样不符合逻辑 让当前数据的长度 和 当前页面 必须不是第一个页面 层级不为一级时
      if (this.goodsData.length === 1 && this.goodsInfo.pagenum > 1) {
        // 让 页数 减减
        --this.goodsInfo.pagenum;
      }
      // 渲染 分类目录数据
      this.getGoods();
    },
    // 回显 跳转路由
    editGoods(id) {
      this.$router.push(`/goodslist/edit/${id}`);
    },
    // 添加 跳转路由
    addGoods() {
      this.$router.push("/goodslist/add");
    },
    // 分页 当前页数量
    handleSizeChange(val) {
      // 修改 数量
      this.goodsInfo.pagesize = val;
      // 渲染 分类目录数据
      this.getGoods();
    },
    // 分页 每页
    handleCurrentChange(val) {
      // 修改 页数
      this.goodsInfo.pagenum = val;
      // 渲染 分类目录数据
      this.getGoods();
    },
    // 渲染商品数据
    async getGoods() {
      // 请求
      const { data: res } = await this.$http.get("/goods_get", {
        params: this.goodsInfo
      });
      // console.log(res);
      // 判断
      if (res.code !== 200) {
        return;
      }
      // 成功
      this.goodsData = res.data;
      // 总数
      this.total = res.total;
    }
  }
};
</script>

<style lang="less">
.goodslist {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
}
</style>