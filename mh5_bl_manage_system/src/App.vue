<template>
  <div class="about">
    <el-upload
      class="upload-demo"
      action="/"
      :http-request="upload"
      :on-preview="handlePreview"
      :on-remove="handleRemove"
      :file-list="fileList"
      list-type="picture"
    >
      <el-button size="small" type="primary">点击上传</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
    </el-upload>

    <img :src="Imgsrc" alt width="200" height="200" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      fileList: [],
      Imgsrc: ""
    };
  },
  methods: {
    // 上传文件
    async upload(params) {
      let formdate = new FormData();
      formdate.append("qqq", params.file);

      let config = {
        headers: {
          "Content-Type": "multipart/form-data"
        }
      };
      // console.log(config);

      const { data: res } = await this.$http.post("/upload", formdate);
      this.Imgsrc = res.url;
    },
    handlePreview() {},
    handleRemove() {},
    handleExceed() {}
  }
};
</script>

<style>
body {
  text-align: center;
  padding-top: 20px;
}
</style>
