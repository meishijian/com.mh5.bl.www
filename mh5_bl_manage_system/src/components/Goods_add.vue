<template>
  <div class="goods_add">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/goodslist' }">商品列表</el-breadcrumb-item>
      <el-breadcrumb-item>添加商品</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 卡片 -->
    <el-card>
      <!-- 警告框 -->
      <el-alert title="添加商品信息" type="info" center show-icon :closable="false"></el-alert>
      <!-- 步骤条 -->
      <el-steps :active="activeName - 0" finish-status="success" align-center>
        <el-step title="商品基本信息"></el-step>
        <el-step title="商品选择分类"></el-step>
        <el-step title="商品封面图片"></el-step>
        <el-step title="商品图片轮播"></el-step>
        <el-step title="商品详情图片"></el-step>
        <el-step title="完成"></el-step>
      </el-steps>

      <!-- 表单 -->
      <el-form
        :model="addForm"
        :rules="addFormRules"
        ref="addFormRef"
        label-width="100px"
        label-position="top"
      >
        <el-tabs
          v-model="activeName"
          tabPosition="left"
          :before-leave="beforeTabHandleClick"
          @tab-click="tabHandleClick"
        >
          <!-- 商品基本信息 -->
          <el-tab-pane label="商品基本信息" name="0">
            <!-- 商品名称 -->
            <el-form-item label="商品名称" prop="goods_name">
              <el-input v-model="addForm.goods_name"></el-input>
            </el-form-item>
            <!-- 商品价格 -->
            <el-form-item label="商品价格" prop="price">
              <el-input v-model="addForm.price" type="number" min="0.1"></el-input>
            </el-form-item>
            <!-- 商品数量 -->
            <el-form-item label="商品数量" prop="stock">
              <el-input v-model="addForm.stock" type="number" min="1"></el-input>
            </el-form-item>
          </el-tab-pane>
          <!-- 商品选择分类 -->
          <el-tab-pane label="商品选择分类" name="1">
            <!-- 商品分类 -->
            <el-form-item label="商品分类" prop="cat_id">
              <!-- 分类级联 -->
              <el-cascader
                v-model="catIds"
                :options="cascaderData"
                :props="cascaderDataProps"
                @change="cascaderDataChange"
              ></el-cascader>
            </el-form-item>
            <!-- 商品店铺 -->
            <el-form-item label="商品店铺" prop="brand_id">
              <!-- 店铺级联 -->
              <el-select v-model="addForm.brand_id" placeholder="请选择">
                <el-option
                  v-for="item in brandData"
                  :key="item.id"
                  :label="item.bra_name"
                  :value="item.id"
                ></el-option>
              </el-select>
            </el-form-item>
            <!-- 服务类型 -->
            <el-form-item label="服务类型" prop="service">
              <!-- 服务类型级联 -->
              <el-select v-model="addForm.service" placeholder="请选择">
                <el-option
                  v-for="item in serviceData"
                  :key="item.id"
                  :label="item.ser_name"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-tab-pane>
          <!-- 商品封面图片 -->
          <el-tab-pane label="商品封面图片" name="2">
            <el-button size="medium" type="warning" @click="getImageShow">上 传 封 面 图 片</el-button>
            <my-upload
              @crop-upload-success="imageUploadSuccess"
              @crop-upload-fail="cropUploadFail"
              v-model="imageShow"
              :width="115"
              :height="115"
              img-format="png"
              :size="size"
              langType="zh"
              :noRotate="false"
              :noSquare="true"
              :noCircle="true"
              field="file"
              :url="uploadURL"
              :headers="headersObj"
            ></my-upload>
            <br />
            <br />
            <el-image :src="imageDataUrl">
              <div slot="error" class="image-slot"></div>
            </el-image>
          </el-tab-pane>
          <!-- 商品图片轮播 -->
          <el-tab-pane label="商品图片轮播" name="3">
            <el-button size="medium" type="warning" @click="getSwipeShow">上 传 轮 播 图 片</el-button>
            <my-upload
              @crop-upload-success="swipeUploadSuccess"
              @crop-upload-fail="cropUploadFail"
              v-model="swipeShow"
              :width="375"
              :height="375"
              img-format="png"
              :size="size"
              langType="zh"
              :noRotate="false"
              :noSquare="true"
              :noCircle="true"
              field="file"
              :url="uploadURL"
              :headers="headersObj"
            ></my-upload>
            <br />
            <br />
            <div v-for="(item, index) in swipeDataUrl" :key="index" class="swpie_div">
              <i @click="swipeDelete(index)" class="el-icon-delete"></i>
              <el-image class="swipeImage" :src="item">
                <div slot="error" class="image-slot"></div>
              </el-image>
            </div>
          </el-tab-pane>
          <!-- 商品详情图片 -->
          <el-tab-pane label="商品详情图片" name="4">
            <el-button size="medium" type="warning" @click="getDetailsShow">上 传 详 情 图 片</el-button>
            <my-upload
              @crop-upload-success="detailsUploadSuccess"
              @crop-upload-fail="cropUploadFail"
              v-model="detailsShow"
              :width="750"
              :height="1800"
              img-format="png"
              :size="size"
              langType="zh"
              :noRotate="false"
              :noSquare="true"
              :noCircle="true"
              field="file"
              :url="uploadURL"
              :headers="headersObj"
            ></my-upload>
            <br />
            <br />
            <div v-for="(item, index) in detailsDataUrl" :key="index" class="details_div">
              <i @click="detailsDelete(index)" class="el-icon-delete"></i>
              <el-image class="detailsImage" :src="item">
                <div slot="error" class="image-slot"></div>
              </el-image>
            </div>
          </el-tab-pane>
          <el-tab-pane label="完成" name="5">
            <!-- 按钮 -->
            <el-button type="primary" class="buttonAdd" @click="commodityAdd">添加商品</el-button>
          </el-tab-pane>
        </el-tabs>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import "babel-polyfill"; // es6 shim
import myUpload from "vue-image-crop-upload";
import { add_Arti_upload, image } from "../config.js";
export default {
  data() {
    return {
      // 商品详情图片 上传
      detailsDataUrl: [],
      // 商品详情图片 状态
      detailsShow: false,
      // 商品图片轮播 上传
      swipeDataUrl: [],
      // 商品图片轮播 状态
      swipeShow: false,
      // 商品封面 上传
      imageDataUrl: "",
      // 商品封面 状态
      imageShow: false,
      size: 5.1,
      // 图片上传路径
      uploadURL: add_Arti_upload,
      // 请求头
      headersObj: {
        Authorization: sessionStorage.getItem("token")
      },
      // 步骤条
      activeName: "0",
      //服务类型 级联数据源
      serviceData: [],
      // 商品店铺 级联数据源
      brandData: [],
      // 存放 级联三级菜单的 id __ 分类
      catIds: "",
      // 级联数据源
      cascaderData: [],
      // 数据所显示的参数 比如名称 子节点 value值
      cascaderDataProps: {
        // 要显示的名称
        label: "cla_name",
        // 要选中的值
        value: "id",
        // 子节点
        children: "children"
      },
      // 表单的数据名
      addForm: {
        //商品名称
        goods_name: "",
        // 商品价格
        price: "",
        // 商品数量
        stock: "",
        // 分类列表
        cat_id: "",
        // 商品店铺
        brand_id: "",
        // 服务类型
        service: "",
        // 商品图片
        image: "",
        // 添加轮播图片 数组
        goods_swipe: [],
        // 商品详情图片 数组
        goods_details: []
      },
      // 添加数据的 数据名验证
      addFormRules: {
        // 商品名称
        goods_name: [
          {
            required: true,
            message: "请输入商品名称",
            trigger: "blur"
          }
        ],
        // 商品价格
        price: [
          {
            required: true,
            message: "请输入商品价格",
            trigger: "blur"
          }
        ],
        // 商品数量
        stock: [
          {
            required: true,
            message: "请输入商品数量",
            trigger: "blur"
          }
        ]
      }
    };
  },
  components: {
    "my-upload": myUpload
  },
  methods: {
    // 商品详情图片 删除
    detailsDelete(index) {
      // 一一查找
      //   表单中的
      let i = this.addForm.goods_details.findIndex((item, i) => i === index);
      // 切割删除 进行删除 数组的某一项
      this.addForm.goods_details.splice(i, 1);

      //  这个是 显示的 图片
      let i2 = this.detailsDataUrl.findIndex((item, i) => i === index);
      this.detailsDataUrl.splice(i2, 1);
    },
    // 商品详情图片 状态
    getDetailsShow() {
      this.detailsShow = !this.detailsShow;
    },
    // 商品详情图片 上传成功回调
    detailsUploadSuccess(jsonData, field) {
      // console.log(jsonData);
      // 判断
      if (jsonData.code !== 200) {
        return this.$message.error("上传失败，请重试");
      }
      // 图片显示路径
      this.detailsDataUrl.push(image + jsonData.file);
      // 上传时需要 图片路径
      this.addForm.goods_details.push(jsonData.file);
    },
    // 商品图片轮播 删除
    swipeDelete(index) {
      // 一一查找
      //   表单中的
      let i = this.addForm.goods_swipe.findIndex((item, i) => i === index);
      // 切割删除 进行删除 数组的某一项
      this.addForm.goods_swipe.splice(i, 1);

      //  这个是 显示的 图片
      let i2 = this.swipeDataUrl.findIndex((item, i) => i === index);
      this.swipeDataUrl.splice(i2, 1);
    },
    // 商品图片轮播 状态
    getSwipeShow() {
      this.swipeShow = !this.swipeShow;
    },
    // 商品图片轮播 上传成功回调
    swipeUploadSuccess(jsonData, field) {
      // console.log(jsonData);
      // 判断
      if (jsonData.code !== 200) {
        return this.$message.error("上传失败，请重试");
      }
      // 图片显示路径
      this.swipeDataUrl.push(image + jsonData.file);
      // 上传时需要 图片路径
      this.addForm.goods_swipe.push(jsonData.file);
    },
    // 商品封面 状态
    getImageShow() {
      this.imageShow = !this.imageShow;
    },
    // 商品封面 上传成功回调
    imageUploadSuccess(jsonData, field) {
      // console.log(jsonData);
      // 判断
      if (jsonData.code !== 200) {
        return this.$message.error("上传失败，请重试");
      }
      // 图片显示路径
      this.imageDataUrl = image + jsonData.file;
      // 上传时需要 图片路径
      this.addForm.image = jsonData.file;
    },
    // 上传失败回调
    cropUploadFail(status, field) {
      // console.log("上传失败状态" + status);
      this.$message.error("上传失败，请重试");
    },
    // 级联下拉菜单  触发后 会执行函数
    cascaderDataChange() {
      // 判断有没有选择 三级菜单
      if (this.catIds.length !== 3) {
        this.catIds = [];
      }
    },
    // 在离开 tabs 前触发该函数
    beforeTabHandleClick(activeName, oldActiveName) {},
    // 切换 tabs 执行所要 数据
    tabHandleClick() {
      // 判断是否  name的值 为 1
      if (this.activeName === "1") {
        // 查询分类
        this.getCatData();
        // 查询 店铺
        this.getBrandData();
        // 查询 服务类型
        this.getServiceData();
      }
    },
    // 查询分类
    async getCatData() {
      // 获取 分类
      let { data: res } = await this.$http.get(`/goods_classify`);
      // console.log(res);
      // 判断
      if (res.code !== 200) return this.$message.error("获取分类失败");
      // 把数据放到 级联数据源 数组中
      this.cascaderData = res.data;
    },
    // 查询 店铺
    async getBrandData() {
      // 获取 分类
      let { data: res } = await this.$http.get(`/goods_list_brand`);
      //   console.log(res);
      // 判断
      if (res.code !== 200) return this.$message.error("获取店铺失败");
      // 把数据放到 级联数据源 数组中
      this.brandData = res.data;
    },
    // 查询 服务类型
    async getServiceData() {
      // 获取 分类
      let { data: res } = await this.$http.get(`/goods_list_service`);
      //   console.log(res);
      // 判断
      if (res.code !== 200) return this.$message.error("获取服务类型失败");
      // 把数据放到 级联数据源 数组中
      this.serviceData = res.data;
    },
    // 添加
    async commodityAdd() {
      // 判断
      this.$refs.addFormRef.validate(async valid => {
        // 判断表单验证
        if (!valid) return this.$message.error("请完善 商品基本信息 在添加!");
        // 分类列表
        if (this.catIds.length !== 3) {
          this.$message.error("请选择商品分类！");
          return false;
        } else {
          this.addForm.cat_id = this.catIds[this.catIds.length - 1];
        }
        // 商品店铺
        if (this.addForm.brand_id === "") {
          this.$message.error("请选择商品店铺！");
          return false;
        }
        // 服务类型
        if (this.addForm.service === "") {
          this.$message.error("请选择服务类型！");
          return false;
        }
        // 商品图片
        if (this.addForm.image === "") {
          this.$message.error("请选择商品封面图片！");
          return false;
        }
        // 添加轮播图片
        if (this.addForm.goods_swipe.length === 0) {
          this.$message.error("请选择商品轮播图片！");
          return false;
        }
        // 商品详情图片
        if (this.addForm.goods_details.length === 0) {
          this.$message.error("请选择商品详情图片！");
          return false;
        }

        // 添加
        const { data: res } = await this.$http.post(
          "/goods_list",
          this.addForm
        );
        // console.log(res);
        // 判断
        if (res.code !== 200) return this.$message.error(res.error);
        // 成功提示框
        this.$message.success(res.message);
        // 跳转页面
        this.$router.push("/goodslist");
      });
    }
  }
};
</script>


<style lang="less">
.goods_add {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
  .el-steps {
    margin: 20px 0;
  }
  .picPreviewPath {
    width: 100%;
  }
  .quillButton {
    margin-top: 20px;
  }
  .el-step__title {
    font-size: 12px !important;
  }

  .swpie_div {
    display: inline;
    user-select: none;
    .swipeImage {
      margin-right: 15px;
      width: 115px;
    }
    .el-icon-delete {
      position: relative;
      left: 0;
      top: 0;
    }
    .el-icon-delete:before {
      content: "\e6d7";
      position: absolute;
      left: 104px;
      top: -126px;
      z-index: 5;
      font-size: 21px;
    }
  }

  .details_div {
    display: inline;
    user-select: none;
    .detailsImage {
      margin-right: 15px;
      width: 115px;
    }
    .el-icon-delete {
      position: relative;
      left: 0;
      top: 0;
    }
    .el-icon-delete:before {
      content: "\e6d7";
      position: absolute;
      left: 104px;
      top: -165px;
      z-index: 5;
      font-size: 21px;
    }
  }
}
</style>