return {
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = "python",
    config = function()
      -- debugpy가 설치된 Python 경로
      require("dap-python").setup("/opt/anaconda3/envs/sample_python/bin/python")
    end,
  },
}
