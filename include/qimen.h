#include <stdio.h>
#include <calendar.h>
#include <data.h>
#include <comline.h>

/*
*   pSolar:             公里日期时间
*   bIsAutoTIme:        是否自动获取时间(1--是，其他不是)
*   qimenJuShu:         气门局数(阴9局到阳9局，-9 ~ 9, 0 表示自动计算局数，其他失败)
*   return:             返回 0 成功，其他失败。
                        -1: 输入的局数不正确
                        -2: 日期数据不合法
                        -3: 日期不在有效范围内
*/
int qimenRun(calSolar* pSolar, int bIsAutoTime, int qimenJuShu);
void qimenFree();

