#################### The C tqm Makefile #######################
ROOT_DIR = .
EXE_NAME = cqm
DEBUG_TARGET_UTF8 = calendar.o data.o qimen.o comline.o
RELEASE_TARGET_UTF8 = utf8_calendar.o utf8_data.o utf8_qimen.o utf8_comline.o 
RELEASE_TARGET_GBK = gbk_calendar.o gbk_data.o gbk_qimen.o gbk_comline.o
WIN_TARGET_DEBUG = wind-calendar.obj wind-data.obj wind-main.obj wind-qimen.obj wind-comline.obj
WIN_TARGET_RELEASE = winr-calendar.obj winr-data.obj winr-main.obj winr-qimen.obj winr-comline.obj
VSCC = cl
VSLINK = link
CC = gcc
MAKE = make
##################################
CFALGS = -g -Wall -std=c99
RCFALGS = -std=c99
WINCFLAGSD = /Zi /c /EHsc /source-charset:utf-8 /execution-charset:gbk /nologo
WINCFLAGS = /c /EHsc /source-charset:utf-8 /execution-charset:gbk /nologo
vpath %.h include
vpath %.c src
INCLUDE_DIR = $(ROOT_DIR)/include

# 默认编译 UTF8 环境下的 Release 版本
all: $(RELEASE_TARGET_UTF8)
	$(CC) $(RCFALGS) -o $(EXE_NAME) main.c $(RELEASE_TARGET_UTF8) -I$(INCLUDE_DIR)
utf8_calendar.o: calendar.h calendar.c define.h
	$(CC) $(RCFALGS) -o utf8_calendar.o -c src/calendar.c -I$(INCLUDE_DIR)
utf8_qimen.o: qimen.h qimen.c define.h data.c data.h calendar.c calendar.h
	$(CC) $(RCFALGS) -o utf8_qimen.o -c src/qimen.c -I$(INCLUDE_DIR)
utf8_data.o: data.h data.c define.h
	$(CC) $(RCFALGS) -o utf8_data.o -c src/data.c -I$(INCLUDE_DIR)
utf8_comline.o: calendar.c calendar.h comline.h comline.c
	$(CC) $(RCFALGS) -o utf8_comline.o -c src/comline.c -I$(INCLUDE_DIR)

# 编译 GBK 环境下的 Release 版本
rgbk: $(RELEASE_TARGET_GBK)
	$(CC) $(RCFALGS) -fexec-charset=GBK -o $(EXE_NAME) main.c $(RELEASE_TARGET_GBK) -I$(INCLUDE_DIR)
gbk_calendar.o: calendar.h calendar.c define.h
	$(CC) $(RCFALGS) -fexec-charset=GBK -o gbk_calendar.o -c src/calendar.c -I$(INCLUDE_DIR)
gbk_qimen.o: qimen.h qimen.c define.h data.c data.h calendar.c calendar.h
	$(CC) $(RCFALGS) -fexec-charset=GBK -o gbk_qimen.o -c src/qimen.c -I$(INCLUDE_DIR)
gbk_data.o: data.h data.c define.h
	$(CC) $(RCFALGS) -fexec-charset=GBK -o gbk_data.o -c src/data.c -I$(INCLUDE_DIR)
gbk_comline.o: calendar.c calendar.h comline.h comline.c
	$(CC) $(RCFALGS) -fexec-charset=GBK -o gbk_comline.o -c src/comline.c -I$(INCLUDE_DIR)

# UTF8 环境下的 debug 版本
debug: $(DEBUG_TARGET_UTF8)
	$(CC) $(CFALGS) -o $(EXE_NAME) main.c $(DEBUG_TARGET_UTF8) -I$(INCLUDE_DIR)
calendar.o: calendar.h calendar.c define.h
	$(CC) $(CFALGS) -o calendar.o -c src/calendar.c -I$(INCLUDE_DIR)
qimen.o: qimen.h qimen.c define.h data.c data.h calendar.c calendar.h
	$(CC) $(CFALGS) -o qimen.o -c src/qimen.c -I$(INCLUDE_DIR)
data.o: data.h data.c define.h
	$(CC) $(CFALGS) -o data.o -c src/data.c -I$(INCLUDE_DIR)
comline.o: calendar.c calendar.h comline.h comline.c
	$(CC) $(CFALGS) -o comline.o -c src/comline.c -I$(INCLUDE_DIR)

# GBK WIN 环境下的 debug 版本
win-debug : $(WIN_TARGET_DEBUG)
	$(VSLINK) /DEBUG /OUT:$(EXE_NAME).exe /SUBSYSTEM:CONSOLE $(WIN_TARGET_DEBUG)
wind-calendar.obj: calendar.h calendar.c define.h
	$(VSCC) $(WINCFLAGSD) /Fowind-calendar.obj /I$(INCLUDE_DIR) src/calendar.c
wind-data.obj: data.h data.c define.h
	$(VSCC) $(WINCFLAGSD) /Fowind-data.obj /I$(INCLUDE_DIR) src/data.c
wind-qimen.obj: qimen.h qimen.c define.h data.c data.h calendar.c calendar.h
	$(VSCC) $(WINCFLAGSD) /Fowind-qimen.obj -c src/qimen.c -I$(INCLUDE_DIR)
wind-main.obj: main.c
	$(VSCC) $(WINCFLAGSD) /Fowind-main.obj /I$(INCLUDE_DIR) main.c
wind-comline.obj: calendar.c calendar.h comline.h comline.c
	$(VSCC) $(WINCFLAGSD) /Fowind-comline.obj -c src/comline.c -I$(INCLUDE_DIR)

win-release : $(WIN_TARGET_RELEASE)
	$(VSLINK) /OUT:$(EXE_NAME).exe /SUBSYSTEM:CONSOLE $(WIN_TARGET_RELEASE)
winr-calendar.obj: calendar.h calendar.c define.h
	$(VSCC) $(WINCFLAGS) /Fowinr-calendar.obj /I$(INCLUDE_DIR) src/calendar.c
winr-data.obj: data.h data.c define.h data.c data.h calendar.c calendar.h
	$(VSCC) $(WINCFLAGS) /Fowinr-data.obj /I$(INCLUDE_DIR) src/data.c
winr-qimen.obj: qimen.h qimen.c define.h
	$(VSCC) $(WINCFLAGS) /Fowinr-qimen.obj -c src/qimen.c -I$(INCLUDE_DIR)
winr-main.obj: main.c
	$(VSCC) $(WINCFLAGS) /Fowinr-main.obj /I$(INCLUDE_DIR) main.c
winr-comline.obj: calendar.c calendar.h comline.h comline.c
	$(VSCC) $(WINCFLAGSD) /Fowinr-comline.obj -c src/comline.c -I$(INCLUDE_DIR)
clean:
	- rm -f *.o
	- rm -f $(EXE_NAME)
wclean:
	- del *.pdb
	- del *.ilk
	- del *.obj
	- del $(EXE_NAME).exe
mclean:
	- del *.o
	- del $(EXE_NAME).exe