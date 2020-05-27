#include<stdlib.h>
#include<stdio.h>
#include<pthread.h>
#include<unistd.h>
#include<time.h>

pthread_mutex_t lock;
int sec = 00, min = 00, hour = 00;

void* print_hr(void* pString)
{
    pthread_mutex_lock(&lock);
    if(min == 59){
        hour++;
        min = 0;
        sec = 0;
    }
    pthread_mutex_unlock(&lock);
    return 0;
}

void* print_min(void* pString)
{
    pthread_mutex_lock(&lock);
    if(sec == 59) {
        min++;
    }
    pthread_mutex_unlock(&lock);
    return 0;
}

void* print_sec(void* pString)
{
    pthread_mutex_lock(&lock);
    sec++;
    if(sec == 59 && min == 59 && hour == 23){
        hour = 0;
        min = 0;
        sec = 0;
    }
    if (sec == 60){
    	sec = 0;	
    }
    pthread_mutex_unlock(&lock);
    return 0;
}

int main() {
time_t t = time(NULL);
    struct tm tm = *localtime(&t);
    hour = tm.tm_hour;
    min = tm.tm_min;
    sec = tm.tm_sec;
    
    pthread_t sec_thread, min_thread, hour_thread;
    
    while(1) {
       	sleep(1);
        pthread_create(&hour_thread, NULL, print_hr, NULL);
        pthread_create(&min_thread, NULL, print_min, NULL);
        pthread_create(&sec_thread, NULL, print_sec, NULL);
        pthread_join(hour_thread, NULL);
        pthread_join(min_thread, NULL);
        pthread_join(sec_thread, NULL);
        printf("------------------%02d:%02d:%02d IST -----------------------\n", hour, min, sec);
    }
    return 0;
}
