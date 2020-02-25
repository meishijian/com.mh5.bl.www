<template>
  <div class="orders">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>订单管理</el-breadcrumb-item>
      <el-breadcrumb-item>订单列表</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 卡片 -->
    <el-card class="box-card">
      <!-- 表格 -->
      <el-table :data="imageData" border style="width: 100%">
        <el-table-column type="index" width="50"></el-table-column>
        <el-table-column prop="order_sn" label="订单号"></el-table-column>
        <el-table-column prop="status" label="下单的状态">
          <template slot-scope="scoped">
            <el-tag type="danger" v-if="scoped.row.status === 0">未支付</el-tag>
            <el-tag type="success" v-else-if="scoped.row.status === 1">已付款，待发货</el-tag>
            <el-tag v-else-if="scoped.row.status === 2">已发货，待收货</el-tag>
            <el-tag type="warning" v-else-if="scoped.row.status === 3">已收货，未评价</el-tag>
            <el-tag type="warning" v-else-if="scoped.row.status === 4">已评价</el-tag>
            <el-tag type="danger" v-else-if="scoped.row.status === 5">退款</el-tag>
            <el-tag type="info" v-else-if="scoped.row.status === 6">取消改订单</el-tag>
            <el-tag type="success" v-else-if="scoped.row.status === 7">订单完成</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="shr_name" label="收货人的姓名"></el-table-column>
        <el-table-column prop="shr_mobile" label="收货人的电话"></el-table-column>
        <el-table-column label="收货人地址" width="400">
          <template
            slot-scope="scoped"
          >{{scoped.row.shr_province + "—" + scoped.row.shr_city + "—" + scoped.row.shr_area + "—" + scoped.row.shr_address}}</template>
        </el-table-column>
        <el-table-column prop="addtime" label="下单时间">
          <template slot-scope="scoped">{{scoped.row.addtime | dateFormat}}</template>
        </el-table-column>
        <el-table-column prop="total_price" label="商品的总价"></el-table-column>
        <el-table-column prop="post_order_sn" label="快递单号"></el-table-column>
      </el-table>

      <br />
      <!-- 分页 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="catInfo.pagenum"
        :page-sizes="[2, 5, 10, 15]"
        :page-size="catInfo.pagesize"
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
      //轮播图数据
      imageData: [],
      catInfo: {
        pagenum: 1, // 当前页码值
        pagesize: 5 // 每页显示多少条数据
      },
      // 总数
      total: 0
    };
  },
  created() {
    this.imageList();
  },
  methods: {
    // 分页 当前页数量
    handleSizeChange(val) {
      // 修改 数量
      this.catInfo.pagesize = val;
      // 渲染 分类目录数据
      this.imageList();
    },
    // 分页 每页
    handleCurrentChange(val) {
      // 修改 页数
      this.catInfo.pagenum = val;
      // 渲染 分类目录数据
      this.imageList();
    },
    //轮播图
    imageList() {
      this.$http.get("/orders_lists", { params: this.catInfo }).then(res => {
        // console.log(res);
        this.imageData = res.data.data;
        // 总数
        this.total = res.data.total;
        // console.log(this.imageList);
      });
    }
  }
};
</script>

<style lang="less">
.orders {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
}
</style>