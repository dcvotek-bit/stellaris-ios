// iCloud anahtar-değer deposu (NSUbiquitousKeyValueStore) — CloudSave.cs
#import <Foundation/Foundation.h>

static char* StellarisCopyString(NSString* s)
{
    if (s == nil) return NULL;
    const char* utf8 = [s UTF8String];
    char* res = (char*)malloc(strlen(utf8) + 1);
    strcpy(res, utf8);
    return res;
}

extern "C" void _StellarisCloudSet(const char* key, const char* value)
{
    NSUbiquitousKeyValueStore* kv = [NSUbiquitousKeyValueStore defaultStore];
    [kv setString:[NSString stringWithUTF8String:value] forKey:[NSString stringWithUTF8String:key]];
    [kv synchronize];
}

extern "C" char* _StellarisCloudGet(const char* key)
{
    NSUbiquitousKeyValueStore* kv = [NSUbiquitousKeyValueStore defaultStore];
    [kv synchronize];
    NSString* v = [kv stringForKey:[NSString stringWithUTF8String:key]];
    return StellarisCopyString(v);
}
