ROOT_DIR           =$(PWD)
BUILD              =build
BUILD_DIR          =$(ROOT_DIR)/$(BUILD)
SRC_DIR            =$(ROOT_DIR)/src
SIM_DIR            =$(ROOT_DIR)/sim
SYN_DIR            =$(ROOT_DIR)/syn
SCRIPT_DIR         =$(ROOT_DIR)/script
REPORT_DIR         =$(ROOT_DIR)/report
SV_DIR             =$(ROOT_DIR)/conf/simvision_conf
NC_DIR             =$(ROOT_DIR)/conf/nWave_conf

TB_TOP             =testfixture
TOP                =mac

SRC=$(shell ls $(SRC_DIR)/*.v)
TB_SRC=$(shell ls $(SIM_DIR)/EXPECT.DAT)

.PHONY: default init check rtl nw sv syn syn_init autosyn pre pre_sv clean gen_def

# Show available all command
default:
	@echo "clean   => Clean previous build"
	@echo "init    => Create necessary directory"
	@echo "rtl     => Run RTL simulation"
	@echo "nw      => Run nWave"
	@echo "sv      => Run Simvision"
	@echo "syn     => Run synthesize in interactive mode"
	@echo "autosyn => Run synthesize in background"
	@echo "pre    => Run gate-level simulation"
	@echo "pre_sv => Run Simvision with pre sim"
	@echo "gen_def => Generate Verilog define macro"

$(BUILD):
	mkdir -p $(BUILD)

# Create folders
init: clean
	mkdir -p $(BUILD_DIR) $(SYN_DIR) $(REPORT_DIR)

# Syn directory init
syn_init:
	mkdir -p $(SYN_DIR)

# Generate header
gen_def:
	sh $(SRC_DIR)/gen_def.sh > $(SRC_DIR)/def.v

cp_tb_src: gen_hex
	cd $(BUILD_DIR); \
	cp $(TB_SRC) .;

# Add your script here
gen_hex:
	cd sw;

# Check HDL syntax
check:
	jg -superlint $(SCRIPT_DIR)/superlint.tcl &

# Run RTL simulation
rtl: $(BUILD) cp_tb_src
	cd $(BUILD_DIR); \
	ncverilog $(SIM_DIR)/$(TB_TOP).v $(SRC) \
	+incdir+$(SRC_DIR) \
	+nc64bit \
	+access+r \
	+define+SHM_FILE=\"$(TOP).shm\" \
	+define+FSDB_FILE=\"$(TOP).fsdb\" \
  +define+FSDB 
   
# View waveform using nWave
nw: $(BUILD)
	cp $(NC_DIR)/signal.rc $(BUILD_DIR); \
	cd $(BUILD_DIR); \
	nWave -f $(TOP).fsdb -sswr $(NC_DIR)/signal.rc +access+r +nc64bit &

# View waveform using simvision
sv: $(BUILD)
	cd $(BUILD_DIR); \
	simvision -waves -input $(SV_DIR)/rtl.sv &

# Run synthesize with Design Compiler
syn: $(BUILD) syn_init
	rm -rf $(SYN_DIR)/*; \
	cd $(BUILD_DIR); \
	cp $(SCRIPT_DIR)/synopsys_dc.setup $(BUILD_DIR)/.synopsys_dc.setup; \
	dcnxt_shell -f $(SCRIPT_DIR)/synthesize.tcl;

# Auto run synthesize with Design Compiler
autosyn: $(BUILD) syn_init
	rm -rf $(SYN_DIR)/*; \
cd $(BUILD_DIR); \
	cp $(SCRIPT_DIR)/synopsys_dc.setup $(BUILD_DIR)/.synopsys_dc.setup; \
	nohup dcnxt_shell -f $(SCRIPT_DIR)/synthesize.tcl &> $(ROOT_DIR)/nohup.log &

# Run gate-level simulation (nWave)
pre: $(BUILD) cp_tb_src syn_init
	cd $(BUILD_DIR); \
	cp $(SYN_DIR)/$(TOP)_syn.sdf $(BUILD_DIR); \
	ncverilog $(SIM_DIR)/$(TB_TOP).v $(SYN_DIR)/$(TOP)_syn.v -v $(SIM_DIR)/fsa0m_a_generic_core_21.lib.src \
	+nc64bit \
	+access+r \
	+define+SHM_FILE=\"$(TOP).shm\" \
	+define+FSDB_FILE=\"$(TOP).fsdb\" \
	+define+SDF \
	+define+SDFFILE=\"$(SYN_DIR)/$(TOP)_syn.sdf\"

# View waveform using simvision
pre_sv: $(BUILD)
	cd $(BUILD_DIR); \
	simvision -waves -input $(SV_DIR)/pre.sv &

# Run ICC APR flow
apr: syn_init
	cp $(SYN_DIR)/$(TOP)_syn.v $(APR_DIR)/design_data/CHIP_syn.v
		cp $(SCRIPT_DIR)/$(TOP)_APR.sdc $(APR_DIR)/design_data/CHIP.sdc

# Remove all files
clean:
	rm -rf $(BUILD_DIR) $(SYN_DIR) $(REPORT_DIR) *.log
