# MEPHAS：医学诊断准确性统计分析平台

![R](https://img.shields.io/badge/R-4.0%2B-276DC3?style=flat-square&logo=r)
![Shiny](https://img.shields.io/badge/Shiny-Web%20Framework-4287f5?style=flat-square&logo=r)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)
![Language](https://img.shields.io/badge/Language-Chinese%20%7C%20English-blue?style=flat-square)

**MEPHAS** (Medical Education Platform for Health And Statistical) 是一个专业的基于Web的医学统计分析平台，用于诊断准确性研究分析。该平台集成了三个应用模块，对应医学统计教科书第4-6章的核心内容。

---

## 效果展示

### 1. ROC曲线分析

![ROC Analysis](项目网页示例/截屏2026-05-03%2013.38.32.png)

**特点**: 
- 支持多种平滑方法（Biweight、Gaussian、Zhou带宽）
- 自动Box-Cox变换优化
- 实时ROC曲线动态渲染

### 2. 非参数平滑ROC曲线

![Non-parametric ROC](项目网页示例/截屏2026-05-03%2013.39.04.png)

**特点**:
- 支持多核心平滑算法
- 灵活的带宽选择
- 参数与效果实时预览

### 3. 分析流程

```
用户输入数据
    ↓
数据验证 & 格式检查
    ↓
统计计算 (Se, Sp, AUC, LR, 等)
    ↓
错误处理 & 异常检测
    ↓
结果可视化 & 报表生成
    ↓
交互式结果展示
```

---

## 项目结构

```
MEPHAS/
├── 第四章 SingleSample/              ← 单样本分析 (19个模块)
│   ├── ui.R, server.R              (Shiny 主入口；Run App 针对此目录)
│   ├── mod_ui_*.R, mod_server_*.R  (19 个分析模块，由主文件 source/注册)
│   └── 分析内容: Se/Sp/PPV/NPV, ROC曲线, 假设检验
│
├── 第五章 CompareTest/              ← 诊断方法比较 (19个模块)
│   ├── ui.R, server.R              (主入口)
│   ├── mod_ui_*.R, mod_server_*.R  (19 个对比模块)
│   └── 分析内容: 成对/非成对数据, 非劣效性, MRMC分析
│
├── 第六章 SampleSize/               ← 样本量计算 (15个模块)
│   ├── ui.R, server.R              (主入口)
│   ├── mod_ui_*.R, mod_server_*.R  (15 个计算模块)
│   └── 分析内容: 基础计算, 非劣效性, 等效性, MRMC
│
├── tab/                            ← 共享函数库
│   ├── func.R                      (绘图函数：散点、逻辑回归、残差、箱线)
│   ├── func2.R                     (数据描述：频数表、汇总统计)
│   ├── func2_causal.R              (因果推理扩展)
│   ├── tab_cn.R, tab_cn_causal.R   (UI菜单配置)
│   └── panel_cn.R                  (面板组件)
│
├── www/                            ← 静态资源
│   ├── style_cn.css                (中文样式表)
│   ├── flowchart.png               (工作流程图)
│   └── favicon.png
│
├── 需要install的R包/               ← 自定义统计包
│   ├── SINGLESAMPLE_0.1.0.tar.gz   (单样本分析统计库)
│   ├── COMPARETESTS_0.1.0.tar.gz   (对比分析统计库)
│   └── SAMPLESIZE_0.1.0.tar.gz     (样本量计算库)
│
└── README.md                       (项目说明，含架构与启动方式)
```

**入口与模块化（和 RStudio「Run App」的关系）**

- 每个子应用目录（如 `第四章 SingleSample/`）里，**`ui.R` 与 `server.R` 是 Shiny 的主入口**：`ui.R` 负责整体界面与导航，并调用各 `mod_ui_*.R`；`server.R` 负责组装 `server` 函数，用 `source()` 读入各 `mod_server_*.R`，再调用 `mod_server_k("modk")` 把模块挂到应用上。
- **`mod_ui_*.R` / `mod_server_*.R`** 是按章节/功能拆开的**模块化**实现，便于维护与扩展；新增分析时通常成对增加 `mod_ui`、`mod_server`，并在两个主文件里注册。
- 在 RStudio 中打开该章下的 **`ui.R` 或 `server.R` 后点击 Run App**，等价于把工作目录设到该文件夹再执行 `shiny::runApp()`（见下文「快速启动」）。

---

## 环境配置（核心要求）

### 系统要求

| 项目 | 要求 | 备注 |
|------|------|------|
| **R版本** | ≥ 3.5.0 | 推荐 4.0+ |
| **R IDE** | RStudio 或命令行 | RStudio推荐 |
| **系统** | Windows / macOS / Linux | 全平台支持 |
| **内存** | ≥ 2GB RAM | 数据加载用途 |
| **网络** | 初始安装需要 | 下载R包 |

### 安装步骤

#### 第1步：安装CRAN依赖包

在R或RStudio中复制运行以下代码：

```r
# 一键安装所有CRAN依赖
packages <- c(
  "shiny",        # Web框架
  "ggplot2",      # 高级绘图
  "plotly",       # 交互式绘图
  "DT",           # 数据表
  "shinyWidgets", # UI增强
  "shinythemes",  # 主题支持
  "dplyr",        # 数据处理
  "psych",        # 心理学统计
  "reshape",      # 数据变形
  "foreign"       # 外部数据格式
)

installed_count <- 0
for (pkg in packages) {
  if (!require(pkg, quietly = TRUE)) {
    cat("📦 正在安装", pkg, "...\n")
    install.packages(pkg, quiet = TRUE)
    cat("   ✓ 安装完成\n")
    installed_count <- installed_count + 1
  } else {
    cat("✓", pkg, "已存在\n")
  }
}

cat("\n CRAN包安装完成！共安装", installed_count, "个新包\n")
```

#### 第2步：安装自定义医学统计包

```r
# 修改以下路径为你的本地路径
pkg_dir <- "/path/to/需要install的R包"
setwd(pkg_dir)

# 安装三个自定义包
custom_packages <- c(
  "SINGLESAMPLE_0.1.0.tar.gz",
  "COMPARETESTS_0.1.0.tar.gz", 
  "SAMPLESIZE_0.1.0.tar.gz"
)

for (pkg_file in custom_packages) {
  cat("📦 正在安装", pkg_file, "...\n")
  install.packages(pkg_file, repos = NULL, type = "source")
  cat("   ✓ 安装完成\n")
}

cat("\n 自定义包安装完成！\n")
```

**完整安装脚本示例** (macOS/Linux 的完整路径)：

```r
# 完整示例：修改以下路径
BASE_PATH <- "/Users/shentianjian/档案信息/科研简历相关材料/23级本科大三-物理学院-沈天健的ai项目和简历/4，5，6章精简版"

# 设置包目录
pkg_dir <- file.path(BASE_PATH, "需要install的R包")
setwd(pkg_dir)

# 依次安装三个自定义包
install.packages("SINGLESAMPLE_0.1.0.tar.gz", repos = NULL, type = "source")
install.packages("COMPARETESTS_0.1.0.tar.gz", repos = NULL, type = "source")
install.packages("SAMPLESIZE_0.1.0.tar.gz", repos = NULL, type = "source")
```

---

## 快速启动指令

路径中含空格或中文时，**推荐直接把应用目录传给 `runApp()`**，不必先 `setwd()`（与 RStudio 里 Run App 行为一致，且不易写错转义）。

```r
# 把 BASE_PATH 换成你本机克隆/解压后的项目根目录
BASE_PATH <- "/path/to/4，5，6章精简版"   # 示例

# 任选一章启动（推荐写法）
shiny::runApp(file.path(BASE_PATH, "第四章 SingleSample"))
shiny::runApp(file.path(BASE_PATH, "第五章 CompareTest"))
shiny::runApp(file.path(BASE_PATH, "第六章 SampleSize"))
```

**等价写法**：先切换工作目录再启动（注意 R 字符串里**不要**写成 `第四章\ SingleSample`——反斜杠是转义符，容易把路径弄错；整段路径用一对双引号包住即可）。

```r
setwd(file.path(BASE_PATH, "第四章 SingleSample"))
shiny::runApp()   # 默认使用当前目录下的 ui.R + server.R
```

**说明**：`shiny::runApp(某目录)` 会在该目录查找 `ui.R` / `server.R`；你项目里各章的 `server.R` 用**相对路径** `source("mod_server_*.R", ...)` 加载模块，因此工作目录或 `runApp` 的 `appDir` 必须是**该章所在文件夹**，不能只在仓库根目录 `runApp()`。

**预期**：浏览器打开（默认 `http://127.0.0.1:3838/`）；第四章 19 个模块，第五、六章功能见下文矩阵表。

---

## 核心逻辑说明

### 1. 应用架构 - Shiny 模块化设计

```
主入口（每个子应用目录各一套）
    ui.R          ← 顶层布局、侧边栏/导航、对各 mod_ui_* 的调用
    server.R      ← source(mod_server_*.R) + server 函数内 mod_server_k("modk")
        │
        ├─→ 模块1: mod_ui_1.R  +  mod_server_1.R
        ├─→ 模块2: mod_ui_2.R  +  mod_server_2.R
        ├─→ 模块3: mod_ui_3.R  +  mod_server_3.R
        └─→ …（第四章 19 对；第五、六章数量见项目结构）
```

**分工**：主文件只做组装与路由；具体统计与界面块放在成对的 `mod_*` 里，避免单文件过大。

**优势**：代码解耦、按章节扩展、UI 与 server 逻辑分离。

### 2. 数据处理流程

```
原始数据 (CSV/Excel)
    ↓
[数据验证层] → 检查: 缺失值、数据类型、范围
    ↓
[处理层] → dplyr操作: 过滤、转换、汇总
    ↓
[分析层] → 调用统计包 (SINGLESAMPLE/COMPARETESTS/SAMPLESIZE)
    ↓
[可视化层] → ggplot2 + plotly 渲染结果
    ↓
交互式结果表 (DT)
```

### 3. 统计分析核心指标

#### **诊断准确性常用指标**

| 指标 | 含义 | 公式 |
|------|------|------|
| **Se** (灵敏度) | 患者中阳性率 | TP / (TP + FN) |
| **Sp** (特异度) | 非患者中阴性率 | TN / (TN + FP) |
| **PPV** | 阳性预测值 | TP / (TP + FP) |
| **NPV** | 阴性预测值 | TN / (TN + FN) |
| **AUC** | ROC曲线下面积 | [0, 1] |
| **LR+** | 正似然比 | Se / (1-Sp) |
| **LR-** | 负似然比 | (1-Se) / Sp |

#### **高级分析方法**

1. **ROC曲线分析**
   - 经验ROC (Empirical)
   - 参数化ROC (Parametric)
   - 非参数ROC + 平滑
   - Box-Cox变换优化

2. **假设检验**
   - Binomial检验 (Se/Sp)
   - DeLong检验 (AUC)
   - 配对t检验 (对比分析)

3. **样本量计算**
   - 基础公式 (Fleiss方法)
   - 非劣效性边界设定
   - 等效性范围设定

### 4. 共享函数库 (`tab/` 文件夹)

#### **func.R** - 绘图函数

```r
plot_scat()    # 散点图 + 线性拟合线
plot_slgt()    # 二分逻辑回归图
plot_resid()   # 残差图
plot_boxplot() # 箱线图
```

#### **func2.R** - 数据描述

```r
describe_var()      # 变量统计描述
freq_table()        # 频数表
summary_stats()     # 汇总统计
missing_analysis()  # 缺失值分析
```

#### **tab_cn.R** - UI配置

```r
create_menu()   # 创建菜单结构
build_navbar()  # 构建导航栏
add_panels()    # 添加面板组件
```

### 5. 响应式编程流程 (Reactive Chains)

```
用户输入 (input$...)
    ↓
[validateInput()] → 输入验证
    ↓
[reactiveData] → 数据处理
    ↓
[reactiveExpr] → 统计计算
    ↓
[render**()] → 渲染输出
    ↓
用户看到结果 (output$...)
```

**关键响应式函数**：
- `reactive()` - 缓存计算结果
- `observe()` - 监听输入变化
- `renderPlot()` - 动态绘图
- `renderTable()` - 动态表格
- `renderUI()` - 动态UI

### 6. 模块内部结构示例

```r
# mod_ui_1.R - UI定义
mod_ui_1 <- function(id) {
  ns <- NS(id)
  list(
    sidebarPanel(
      h3("参数设置"),
      sliderInput(ns("n"), "样本量", 10, 1000, 100)
    ),
    mainPanel(
      plotOutput(ns("plot")),
      tableOutput(ns("table"))
    )
  )
}

# mod_server_1.R - 服务器逻辑
mod_server_1 <- function(input, output, session, ...) {
  
  # 响应式数据处理
  data_reactive <- reactive({
    # 执行统计分析
    SINGLESAMPLE::analyze_roc(...)
  })
  
  # 渲染图表
  output$plot <- renderPlot({
    ggplot(...) + theme_minimal()
  })
  
  # 渲染表格
  output$table <- renderTable({
    DT::datatable(data_reactive())
  })
}
```

---

## 统计方法支持矩阵

### 第四章：单样本分析

| 模块 | 数据类型 | 方法 | 输出 |
|------|---------|------|------|
| 1-5 | 二分 | Se/Sp/PPV/NPV及信区间 | 表格 + 置信区间图 |
| 6-9 | 有序 | 经验/参数/非参数ROC | ROC曲线 |
| 10-15 | 连续 | Box-Cox变换 + 平滑ROC | 平滑ROC曲线 |
| 16-19 | ROC | 假设检验 | p值 + 检验统计量 |

### 第五章：对比分析

| 模块 | 数据类型 | 对比方法 | 设计 |
|------|---------|--------|------|
| 1-4 | 二分 | Se/Sp对比 | 成对 / 非成对 |
| 5-9 | ROC | AUC对比 | 成对 / 非成对 |
| 10-13 | 多读者 | MRMC分析 | 随机化完全设计 |

### 第六章：样本量计算

| 模块 | 指标 | 研究类型 | 算法 |
|------|------|---------|------|
| 1-7 | Se/Sp | 基础研究 | Fleiss二项 |
| 8-11 | Se/Sp | 非劣效性 | 单臂非劣效 |
| 12-15 | 多指标 | 等效性 | 双臂等效 |

---

## 使用场景示例

### 场景1：医学生学习诊断学

```
1. 打开第四章应用
2. 上传医学影像诊断数据 (金标准 vs 测试结果)
3. 自动计算 Se/Sp/AUC
4. 生成ROC曲线和置信区间
5. 导出报告用于课程作业
```

### 场景2：科研人员设计研究

```
1. 打开第六章应用
2. 输入非劣效性边界 (delta = 0.05)
3. 指定预期灵敏度
4. 自动计算所需样本量
5. 生成研究设计报告
```

### 场景3：临床医生比较诊断方法

```
1. 打开第五章应用
2. 输入两种诊断方法的结果 (n=150对患者)
3. 选择"非劣效性检验"
4. 获得对比统计结果和结论
5. 用于临床决策支持
```

---

## 技术栈详解

### 核心框架

| 技术 | 版本 | 用途 |
|------|------|------|
| **R** | ≥3.5.0 | 编程语言 |
| **Shiny** | 最新 | Web框架 + 交互 |
| **ggplot2** | 最新 | 静态绘图 |
| **plotly** | 最新 | 交互式绘图 |

### UI增强

```r
shinyWidgets    # 丰富的输入组件
shinythemes     # 预定义主题
DT              # 高级数据表
```

### 数据处理

```r
dplyr           # 数据管道操作
reshape         # 数据变形
psych           # 描述性统计
foreign         # 支持外部格式 (SAS, SPSS)
```

### 自定义统计包

```r
SINGLESAMPLE    # 单样本诊断准确性分析
COMPARETESTS    # 诊断方法对比
SAMPLESIZE      # 样本量计算
```

---

## 常见问题 (FAQ)

### Q1: 如何修改应用的语言？

**A**: 编辑 `tab/tab_cn.R` 中的菜单文本即可支持多语言。

### Q2: 如何添加新的分析模块？

**A**: 
1. 创建 `mod_ui_20.R` 和 `mod_server_20.R`
2. 在 `server.R` 和 `ui.R` 中注册新模块

### Q3: 数据导入支持哪些格式？

**A**: 支持 CSV、Excel、SAS、SPSS 等（通过 `foreign` 包）

### Q4: 如何部署到服务器？

**A**: 使用 Shiny Server 或 RStudio Connect 部署

### Q5: 能否离线使用？

**A**: 可以，安装所有包后无需网络连接

---

## 引用与致谢

本项目基于医学统计学经典教材的第4-6章内容开发，适用于：

- 医学统计学教学
- 诊断准确性研究
- 临床决策支持
- 数据分析教育

---

## 许可证

MIT License - 自由使用、修改、分发

---

## 贡献者

开发者：沈天健  
学院：北京大学物理学院  
年级：23级本科大三  

---

---

Last Updated: 2026年5月3日
