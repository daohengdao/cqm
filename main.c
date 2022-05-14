#include <stdio.h>
#include <calendar.h>
#include <qimen.h>
#include <comline.h>
/*
*   时家奇门遁甲排盘结果打印 (超接置润-转盘)
*   CQM (cqm)       纯C语言(C99标准)实现。 
*                   version:     1.0.1
*                   designed by: TAYNPG
*
*          https://gitee.com/taynpg/cqm  
*/

int main(int argc, char** argv)
{
    int nJushu = 0;
    int bIsAutoTime = 0;
    calSolar solar;

    int re = ParseCommand(argc, argv, &solar, &nJushu, &bIsAutoTime);
    if (re != 0)
        return -1;
    
    int qimenRet = qimenRun(&solar, bIsAutoTime, nJushu);
    if (qimenRet == 0)
        PrintResult();

    comlineFree();
    qimenFree();
    
    return 0;
}

