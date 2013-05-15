

#import "Localizer.h"

@implementation Localizer
{
}
   
- (NSString*) Sentby :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"\n\nSent by %@";
    }
        
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"\n\nEnvoyé par %@";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"\n\nInviato da  %@";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"\n\nGesendet von  %@";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"\n\nEnviado por  %@";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"\n\n发送  %@";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"%@によって\n\nを送信";
    }
    else return @"Error";
}

- (NSString*) addEvent :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"add event";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"ajoute évènement";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"aggiungi avvenimento";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"erreignis hinfügen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"agregar el evento";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"添加事件";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"イベントの追加";
    }
    else return @"Error";
}
- (NSString*) audioInput :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Audio input hardware not available";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Du matériel d'entrée audio n'est pas disponible";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ingresso hardware audio non disponibile";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Audio-Eingang Hardware nicht verfügbar";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Hardware de entrada de audio no está disponible";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"音频输入硬件不可用";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"利用不可な音声入力ハードウェア";
    }
    else return @"Error";
}
- (NSString*) CalendarEvent :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Calendar Event";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Évènement dans le Calendrier";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Calendario eventi";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Kalenderereignis";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Calendario de eventos";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"日历事件";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"カレンダー・イベント";
    }
    else return @"Error";
}

- (NSString*) CalendarEventAtAdded :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Calendar Event: %@ at %@ added";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Évènement dans le Calendrier: %@ au %@ ajoutée";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Calendario eventi: %@ a %@ ha aggiunto";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Kalenderereignis: %@ bei %@ ha hinzugefügt";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Calendario de eventos: %@ en %@ añadido";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"日历事件: ％@在％@ 补充";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"カレンダー・イベント%@ で%@ を追加";
    }
    else return @"Error";
}

- (NSString*) CantsendSMS :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Can't send SMS";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Impossible d'envoyer des SMS";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Non è possibile inviare SMS";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Kann keine SMS";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"No se puede enviar SMS";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"无法发送短信";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"SMS送信不可能";
    }
    else return @"Error";
}

- (NSString*)  ConnecttoFacebook:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Connect to Facebook";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Connectez-vous à Facebook";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Collegarsi a Facebook";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Verbinden Sie Facebook";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Conectarse a Facebook";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"连接到Facebook";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Facebookに接続";
    }
    else return @"Error";
}

- (NSString*)  copythis:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"copy this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"copier ça";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"copiare questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"dies kopieren";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"copiar esto";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"复制它";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"コピーする";
    }
    else return @"Error";
}

- (NSString*)  CopytoClipboard:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Copy to Clipboard";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Copier sur le presse-papiers";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Copia negli Appunti";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Kopieren in die Zwischenablage";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Copiar al portapapeles";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"复制到剪贴板";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"クリップボードにコピー";
    }
    else return @"Error";
}

- (NSString*)  atmidnight :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"DD MM yyyy at midnight";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"DD MM yyyy à minuit";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"DD MM yyyy a mezzanotte";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"DD MM yyyy um Mitternacht";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"DD MM yyyy a la medianoche";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"DD MM yyyy 在午夜";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"DD MM yyyy 真夜中に";
    }
    else return @"Error";
}

- (NSString*) atnoon :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"DD MM yyyy at noon";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"DD MM yyyy à midi";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"DD MM yyyy a mezzogiorno";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"DD MM yyyy mittags";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"DD MM yyyy al mediodía";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"DD MM yyyy 中午";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"DD MM yyyy 正午に";
    }
    else return @"Error";
}

- (NSString*)  midnight:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"DD MM yyyy midnight";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"DD MM yyyy minuit";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"DD MM yyyy mezzanotte";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"DD MM yyyy Mitternacht";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"DD MM yyyy medianoche";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"DD MM yyyy 午夜";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"DD MM yyyy 真夜中";
    }
    else return @"Error";
}

- (NSString*)  noon :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"DD MM yyyy noon";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"DD MM yyyy midi";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"DD MM yyyy mezzogiorno";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"DD MM yyyy Mittag";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"DD MM yyyy mediodía";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"DD MM yyyy 中午";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"DD MM yyyy 正午";
    }
    else return @"Error";
}

- (NSString*)  DeleteNote :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Delete Note";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Supprimer une note";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Eliminare nota";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Notiz löschen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Suprimir la nota";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"删除注释";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"メモを削除";
    }
    else return @"Error";
}

- (NSString*)  dictation :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Dictation";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Dictée";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Dettato";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Diktat";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Dictado";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"正常声音录入以";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"口述";
    }
    else return @"Error";
}

- (NSString*) dictationType :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Dictation Type";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Type de Dictée";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Tipo di Dettato";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Diktatart";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Tipo de dictado";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"语音录入的类型";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"口述タイプ";
    }
    else return @"Error";
}

- (NSString*) domain :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Domain";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Domaine";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Dominio";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Domain";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Dominio";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"域名";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ドメイン";
    }
    else return @"Error";
}
- (NSString*) duration :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Duration";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Durée";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Durazione";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Dauer";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Duración";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"持续时间";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"持続時間";
    }
    else return @"Error";
}



- (NSString*) Email :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Email";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Courriel";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Email";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Email";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Email";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"邮件";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Ｅメール";
    }
    else return @"Error";
}

- (NSString*)  Emailerror:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Email send error";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Courriel envoyer des erreur";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Inviare email errore";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"E-Mail senden Fehler";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Email enviar error";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"电子邮件发送错误";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"エラーを送信するＥメール";
    }
    else return @"Error";
}

- (NSString*) emailthis :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"email this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Courriel ça";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Email questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Dies Mailen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"enviar email";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"发送邮件";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Ｅメールする";
    }
    else return @"Error";
}

- (NSString*) englishAU :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"English AU";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Anglais (A.U.)";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Inglese(A.U.)";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Englisch AU";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Inglés Au.";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"英语 (澳洲) ";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"英語 (AU)";
    }
    else return @"Error";
}


- (NSString*) englishUK :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"English UK";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Anglais (U.K.)";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Inglese(U.K.)";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Englisch UK";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Inglés GB.";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"英语 (英国) ";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"英語 (UK)";
    }
    else return @"Error";
}
- (NSString*) englishUS :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"English US";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Anglais (U.S.)";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Inglese(U.S.)";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Englisch UK";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Inglés UU.";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"英语（美国)";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"英語 (US)";
    }
    else return @"Error";
}


- (NSString*)  Enterpassword:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Enter password";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Entrez le mot de passe";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"mmettere la password";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Geben Sie das Passwort";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Introduzca la contraseña";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"输入密码";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"パスワードを入力";
    }
    else return @"Error";
}

- (NSString*)  Enterusername:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Enter username";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Entrez le nom d'utilisateur";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"inserire il nome utente";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Geben Sie den Benutzernamen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Ingrese nombre de usuario";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"输入用户名";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ユーザ名を入力";
    }
    else return @"Error";
}

- (NSString*)  ErrorsendingSMS :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Error sending SMS";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Erreur d'envoi de SMS";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Errore di invio di SMS";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Fehler beim Senden der SMS";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Error al enviar el SMS";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"错误发送短信";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"SMS送信エラー";
    }
    else return @"Error";
}

- (NSString*)  Errorpostingtweet :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Error posting tweet";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Tweet Erreur affichage";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Errore inviando tweet";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Fehler Posting tweet";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Error publicar tweet";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"错误张贴“Tweet”";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Tweet投稿エラー";
    }
    else return @"Error";
}
- (NSString*)  facebookthis:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"facebook this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Facebook Ça";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Facebook Questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Dies Facebook";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Enviar a Facebook";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"发布到 Facebook";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Facebookする";
    }
    else return @"Error";
}
- (NSString*)  fileExists:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"File already exist with this name";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Fichier existe déjà avec ce nom";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"File già esistono con questo nome";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Die Datei ist bereits mit diesem Namen existiert";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"El archivo ya existe con este nombre";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"文件已经存在具有此名称";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ファイルに既存済みの名前です。";
    }
    else return @"Error";
}
- (NSString*) find :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"find";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Trouve";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Trova";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Finden";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"encontrar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"查找";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"見つける";
    }
    else return @"Error";
}


- (NSString*)  findViaMaps :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Find via Maps";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Trouver via des cartes";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Trova via Mappe";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Suche über Karte";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Buscar a través de mapas";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"通过地图查找";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"地図を利用して見つける";
    }
    else return @"Error";
}

- (NSString*)  FlagNote:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Flag Note";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Remarque Drapeau";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Nota bandiera";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Flag Hinweis";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Marca de anotación";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"标志注";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"フラグメモ";
    }
    else return @"Error";
}

- (NSString*)  flagthis:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"flag this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Marque Ça";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Marca Questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Dies Markieren";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"marcar esto";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"标记它";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"フラグを付ける";
    }
    else return @"Error";
}

- (NSString*) Flagged :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Flagged";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Marqués";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Contrassegnati";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Gekennzeichnet";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Bandera";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"标帜";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"フラグ付き";
    }
    else return @"Error";
}

- (NSString*)  French :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"French";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Français";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Francese";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Französisch";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Francés";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"法语";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"フランス語";
    }
    else return @"Error";
}
- (NSString*)  German :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"German";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Allemand";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Tedesco";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Deutsch";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Alemán";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"德语";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ドイツ語";
    }
    else return @"Error";
}

- (NSString*)  Invalidusernameorpassword :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Invalid username or password";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Nom d'utilisateur ou mot de passe";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Nome utente o password non valida";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Ungültiger Benutzername oder Kennwort";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"No válido nombre de usuario o contraseña";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"用户名或密码无效";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"無効なユーザー名またはパスワード";
    }
    else return @"Error";
}

- (NSString*) Italian :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Italian";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Italien";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Italiano";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Italienisch";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"italiano";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"意大利语";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"イタリア語";
    }
    else return @"Error";
}
- (NSString*)  ListenonStart:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Listen on Start";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Ecoute au Début ";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ascoltare all’inizio";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Am Start zuhören";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Escuchar al Iniciar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"开启即倾听";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"リッスン・オン・スタート";
    }
    else return @"Error";
}
- (NSString*)  Mandarin:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Mandarin";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Mandarin";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Mandarino";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Chinesisch";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Mandarín";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"普通话";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"中国語";
    }
    else return @"Error";
}
- (NSString*)  Message:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Message";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Message";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Messaggio";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Message";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Mensaje";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"消息";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"メッセージ";
    }
    else return @"Error";
}

- (NSString*)  Messagecopiedtoclipboard:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Message copied to clipboard";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Message copié dans le presse papier";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Messaggio copiato negli appunti";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Nachricht in die Zwischenablage kopiert";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Mensaje copiado al portapapeles";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"消息复制到剪贴板";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"メッセージをクリップボードにコピー";
    }
    else return @"Error";
}
- (NSString*) MessageSent:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Message Sent.";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Message envoyé.";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Messaggio inviato.";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Mitteilung";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Mensaje enviado.";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"消息发送.";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"メッセージ送信完了";
    }
    else return @"Error";
}
- (NSString*)  Name:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Name";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Nom";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Nome";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Name";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Nombre";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"名称";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"名前";
    }
    else return @"Error";
}
- (NSString*) Notecopied :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Note copied";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Remarque copié";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Nota copiato";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Hinweis kopiert";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Nota copiada";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"便签已复制";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"メモをコピー";
    }
    else return @"Error";
}

- (NSString*)  Other:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Other";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Autres";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Altro";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Andere";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Otro";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"其他";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"その他";
    }
    else return @"Error";
}
- (NSString*) Password :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Password";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Mot de passe";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Password";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Passwort";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Contraseña";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"密码";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"パスワード";
    }
    else return @"Error";
}
- (NSString*) Posted :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Posted.";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Posté.";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Postato.";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Geschrieben.";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Publicado.";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"发表。";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"投稿完了";
    }
    else return @"Error";
}
- (NSString*) PostingtoFacebook:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Posting to Facebook";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Affichage à Facebook";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Annuncio a Facebook";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Buchung auf Facebook";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Anuncio a Facebook";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"发布到Facebook";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Facebookに投稿";
    }
    else return @"Error";
}
- (NSString*)  Postingtweettotwitterserver:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Posting tweet to twitter server";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Affichage tweet à twitter serveur";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Distacco tweet al server di twitter";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Posting tweet auf twitter Server";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Publicar tweets a twitter servidor";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"张贴到Twitter服务器tweet";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"TwitterサーバーへTweetを投稿";
    }
    else return @"Error";
}
- (NSString*)  RecordOnly:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Record Only";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Enregistrez uniquement";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Solo registrazione";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Nur Aufnahme";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Grabar solamente";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"仅记录";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"録音のみ";
    }
    else return @"Error";
}
- (NSString*)Reminder:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Reminder";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Rappelle";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ricorda";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Erinnern";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Recordatorio";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"提醒";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"予定通知";
    }
    else return @"Error";
}
- (NSString*)  reminderAded :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Reminder: %@ at %@ added";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Rappelle: %@ à %@ a ajouté";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ricorda: %@ a %@ ha aggiunto";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Erinnern: %@ auf %@ fügte";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Recordatorio: %@ a %@ añadió";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"提醒: %@在%@";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"予定通知: %@で%@を追加";
    }
    else return @"Error";
}
- (NSString*) savethis :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"save this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"enregistrer cette";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"salvare questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"speichern Sie diese";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"guardar este";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"保存此";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"保存する";
    }
    else return @"Error";
}
- (NSString*)  Saved:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Saved";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Sauvegardé";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Salvato";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Gespeichert";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Guardado";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"保存";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"保存完了";
    }
    else return @"Error";
}
- (NSString*)  SearchEngine:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Search Engine";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Moteur de recherche";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Motore di ricerca";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Suchmaschine";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Motor de búsqueda";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"搜索引擎";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"検索エンジン";
    }
    else return @"Error";
}
- (NSString*)  searchFor :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"search for";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Chercher";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ricerca";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Suchen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Buscar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"搜索";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"検索する";
    }
    else return @"Error";
}
- (NSString*)  SearchviaBing:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Search via Bing";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Recherche par Bing";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ricerca tramite Bing";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Suche über Bing";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Buscar a través de Bing";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"搜索通过Bing";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Bingで検索";
    }
    else return @"Error";
}
- (NSString*)  SearchviaGoogle:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Search via Google";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Recherche par Google";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ricerca tramite Google";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Suche über Google";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Buscar a través de Google";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"搜索通过Google";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Googleで検索";
    }
    else return @"Error";
}

- (NSString*)  SearchviaYahoo :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Search via Yahoo";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Recherche par Yahoo";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ricerca tramite Yahoo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Suche über Yahoo";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Buscar a través de Yahoo";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"搜索通过Yahoo";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Yahooで検索";
    }
    else return @"Error";
}
- (NSString*)  SendFailed:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Send Failed";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Échec de l'envoi";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Impossibile inviare";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Senden fehlgeschlagen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Enviar Error";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"发送失败";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"送信に失敗";
    }
    else return @"Error";
}
- (NSString*) Spanish :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Spanish";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Espagnol";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Spagnolo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Spanisch";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Español";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"西班牙语";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"スペイン語";
    }
    else return @"Error";
}
- (NSString*)  successefulPostToWordpress:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Successfully posted to Wordpress server";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Réussir posté à Wordpress serveur";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Successo inviati ad server di Wordpress";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Erfolgreich auf Wordpress-Server veröffentlicht";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Se ha publicado correctamente al servidor de Wordpress";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"成功发布到WordPress服务器";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Wordpressサーバーに投稿成功";
    }
    else return @"Error";
}

- (NSString*)  textthis:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"text this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Texte Ça";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Testo questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Dies texten";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"enviar por mensaje";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"语音短信";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"テキストする";
    }
    else return @"Error";
}
- (NSString*)  twitterthis:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"twitter this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Twitter Ça";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Twitter questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Dies Twitter";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"enviar a  twitter";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"发布到 Twitter";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Twitterする";
    }
    else return @"Error";
}
- (NSString*) UnabletoaddReminder :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Unable to add Reminder";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Impossible d'ajouter Rappel";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Impossibile aggiungere promemoria";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Kann die Erinnerung hinzufügen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"No se puede agregar recordatorio";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"无法添加提醒";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"予定通知の追加不可能";
    }
    else return @"Error";
}
- (NSString*) Unabletostartserver :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Unable to start server";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Impossible de démarrer le serveur";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Impossibile avviare il server di";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Kann Server starten";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"No se puede iniciar el servidor";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"无法启动服务器";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"サーバーを起動できない";
    }
    else return @"Error";
}

- (NSString*)Update:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Update";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Mise à jour";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Aggiornare";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Aktualisierung";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Actualización";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"更新";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"更新";
    }
    else return @"Error";
}
- (NSString*)  User:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"User";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Utilisateur";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Utente";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Benutzer";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Usuario";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"用户";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ユーザー";
    }
    else return @"Error";
}
- (NSString*)Username:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Username";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Nom d'utilisateur";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Nome utente";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Benutzername";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Nombre de usuario";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"用户名";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ユーザー名";
    }
    else return @"Error";
}

- (NSString*) Warning :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Warning";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Attention";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Avvertimento";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Warnung";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Advertencia";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"警告";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"警告";
    }
    else return @"Error";
}
- (NSString*) WebSearch :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Web Search";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Recherche Web";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Ricerca web";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Internetsuche";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Búsqueda web";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"搜索网络";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ウェブ検索";
    }
    else return @"Error";
}
- (NSString*) wordpressAuthFail :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Wordpress authentication failed";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Wordpress authentification a échoué";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Wordpress autenticazione fallita";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Wordpress-Authentifizierung fehlgeschlagen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Wordpress error en la autenticación";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"WordPress的身份验证失败";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Wordpressの認証に失敗";
    }
    else return @"Error";
}
- (NSString*)wordpressthis:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"wordpress this";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Wordpress ça";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Wordpress questo";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Dies Wordpress";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"enviar a wordpress";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"发布到 Wordpress";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Wordpressする";
    }
    else return @"Error";
}


- (NSString*)  YourEmailNotConfigured :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Your email is not configured";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Votre adresse email n'est pas configuré";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Il tuo indirizzo email non è configurato";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Ihre E-Mail ist nicht konfiguriert";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Tu email no se ha configurado";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"您的电子邮件没有配置";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"メールアドレスが設定されていません。";
    }
    else return @"Error";
}

- (NSString*)  january:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"january";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"janvier";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"gennaio";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"januar";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"enero";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"一月Or 1 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"１ 月";
    }
    else return @"Error";
}
- (NSString*)  february:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"february";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"février";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"febbraio";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"februar";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"febrero";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"2 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"２月";
    }
    else return @"Error";
}
- (NSString*)march:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"march";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"mars";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"marcia";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"märz";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"marcha";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"3 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"３ 月";
    }
    else return @"Error";
}
- (NSString*)  april:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"april";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"avril";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"aprile";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"april";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"abril";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"4 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"４ 月";
    }
    else return @"Error";
}
- (NSString*)  may:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"may";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"mai";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"maggio";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"mai";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"mayo";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"5 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"5 月";
    }
    else return @"Error";
}
- (NSString*)  june:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"june";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"juin";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"giugno";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"juni";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"junio";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"6 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"6 月";
    }
    else return @"Error";
}
- (NSString*) july :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"july";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"juillet";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"luglio";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"juli";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"julio";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"7 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"7 月";
    }
    else return @"Error";
}
- (NSString*)  august:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"august";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"août";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"agosto";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"august";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"agosto";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"8 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"8 月";
    }
    else return @"Error";
}
- (NSString*)  september:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"september";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"septembre";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"settembre";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"september";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"septiembre";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"9 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"9 月";
    }
    else return @"Error";
}
- (NSString*)  october:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"october";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"octobre";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"ottobre";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"oktober";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"octubre";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"10 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"10 月";
    }
    else return @"Error";
}

- (NSString*)  november:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"november";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"novembre";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"novembre";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"november";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"noviembre";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"11 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"11 月";
    }
    else return @"Error";
}
- (NSString*) december :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"december";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"décembre";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"dicembre";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"dezember";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"diciembre";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"12 月";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"12 月";
    }
    else return @"Error";
}
- (NSString*)back:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Back";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Retour";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Indietro";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Zurück";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Atrás";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"返回";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"戻る";
    }
    else return @"Error";
}
- (NSString*)  Done:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Done";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Fait";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Realizzato";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Fertig";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Listo";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"完成";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"完了";
    }
    else return @"Error";
}
- (NSString*)  Version:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Version";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Version";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Versione";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Version";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Versión";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"版本";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"バージョン";
    }
    else return @"Error";
}
- (NSString*)  WifiShare:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Wifi Share";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Partage Wifi";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Condivisione Wifi";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Wifi Teilen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Compartir por Wifi";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"Wifi 共有";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"Wifi 共有";
    }
    else return @"Error";
}
- (NSString*)  Settings:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Settings";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Paramètres";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Impostazioni";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Einstellungen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Configuración";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"设置";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"設定";
    }
    else return @"Error";
}

-(NSString*) Language :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Language";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Langue";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Lingua";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Sprache";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Idioma";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"语言";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"言語";
    }
    else return @"Error";
}
- (NSString*) Failedtoconnecttoserver :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Failed to connect to server";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Connexion au serveur échouée";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Connessione al server non riuscita";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Verbindung zum Server fehlgeschlagen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Falló la conexión con el servidor";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"与服务器连接失败";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"サーバーへの接続に失敗しました。";
    }
    else return @"Error";
}
- (NSString*) orvisit :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"or visit";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"ou visitez";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"ovvero vistare";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"oder besuchen Sie";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"o visite";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"或访问";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"または訪問する";
    }
    else return @"Error";
}
- (NSString*)  PleaseDirectYourBrowser:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Please direct your web browser to the following address:";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Prière de directionner votre navigateur  vers l’adresse suivante";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Si prega di direzionare il suo browser verso l’indirizzo seguente";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Richten Sie bitte Ihr Browser zur folgenden Adresse";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Por favor, dirija su navegador a la siguiente dirección:";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"请用浏览器访问以下网址:";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"以下のアドレスにアクセスしてください。";
    }
    else return @"Error";
}
- (NSString*)  Creatingzipfilepleasebepatient:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Creating zip file, please be patient";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Création d'un fichier zip, s'il vous plaît soyez patient";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Creare file zip, vi preghiamo di essere pazienti";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Erstellen zip-Datei, bitte haben Sie Geduld";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Crear el archivo zip, por favor, sea paciente";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"创建zip文件，请耐心等待";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"zip fileを作成中。そのままお待ちください";
    }
    else return @"Error";
}
- (NSString*) Readytodownload :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Ready to download";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Prêt à télécharger";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Pronti per il download";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Bereit zum Download";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Listo para descargar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"准备下载";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ダウンロードの準備";
    }
    else return @"Error";
}
- (NSString*)  ListView:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"List View";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Liste";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Lista";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Liste";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Vista de lista";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"列表";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"リスト一覧";
    }
    else return @"Error";
}
- (NSString*)  About:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"About";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"À propos";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Circa";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Über";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Acerca de";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"关于";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"関して";
    }
    else return @"Error";
}
- (NSString*)  Edit:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Edit";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Modifier";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Modifica";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Bearbeiten";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Editar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"编辑";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"編集";
    }
    else return @"Error";
}
- (NSString*)Help:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Help";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Aide";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Aiuto";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Hilfe";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Ayuda";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"帮助";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ヘルプ";
    }
    else return @"Error";
}
- (NSString*)  ChangeLogin:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Change Login";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Changer Login";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Cambia Login";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Login Wechseln";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Cambiar Inicio de sesión";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"更改登录帐户";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"ログインアカウントの変更";
    }
    else return @"Error";
}
- (NSString*)  Share:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Share";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Partager";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Condividere";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Teilen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Compartir";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"共有";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"共有";
    }
    else return @"Error";
}
- (NSString*)Save:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Save";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Enregistrer";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Salva";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Sparen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Ahorrar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"保存";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"保存";
    }
    else return @"Error";
}
- (NSString*)  Cancel:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Cancel";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Annuler";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Annullare";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Kündigen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Cancelar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"取消";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"キャンセル";
    }
    else return @"Error";
}
- (NSString*)  Delete:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Delete";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Supprimer";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Cancellare";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"löschen";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Borrar";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"删除";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"削除";
    }
    else return @"Error";
}
- (NSString*) Processing :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Processing…";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"traitement";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"elaborazione";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Verarbeitung";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"transformación";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"處理";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"処理中";
    }
    else return @"Error";
}
- (NSString*)  japanese :(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Japanese";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Japonais";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Giapponese";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Japanisch";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Japonés";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"日语";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"日本語";
    }
    else return @"Error";
}
- (NSString*)  helpImage :(NSString*) lang : (int) i
{
    NSString* response = @"help_tags_";
    if (i==0)
    {
        response=[response stringByAppendingString:@"add_event"];
    }
    else if (i==1)
    {
        response=[response stringByAppendingString:@"copy"];
    }
    else if (i==2)
    {
        response=[response stringByAppendingString:@"email"];
    }
    else if (i==3)
    {
        response=[response stringByAppendingString:@"facebook"];
    }
    else if (i==4)
    {
        response=[response stringByAppendingString:@"find"];
    }
    else if (i==5)
    {
        response=[response stringByAppendingString:@"flag"];
    }
    
    else if (i==6)
    {
        response=[response stringByAppendingString:@"message"];
    }
    else if (i==7)
    {
        response=[response stringByAppendingString:@"reminder"];
    }
    else if (i==8)
    {
        response=[response stringByAppendingString:@"search"];
    }
    else if (i==9)
    {
        response=[response stringByAppendingString:@"twitter"];
    }
    else if (i==10)
    {
        response=[response stringByAppendingString:@"wordpress"];
    }
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        response= [response stringByAppendingString:@"_en"];    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
       response= [response stringByAppendingString:@"_fr"]; 
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
       response= [response stringByAppendingString:@"_it"]; 
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
       response= [response stringByAppendingString:@"_de"]; 
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
       response= [response stringByAppendingString:@"_es"]; 
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        response= [response stringByAppendingString:@"_mn"]; 
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        response= [response stringByAppendingString:@"_jp"]; 
    }
    response= [response stringByAppendingString:@".png"]; 
    return response;
}

- (NSString*)  logs:(NSString*) lang
{
    if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
    {
        return  @"Logs";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        return @"Journaux";
        
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        return @"Registri";
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        return@"Logbücher";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        return @"Registros";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        return @"日志";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        return  @"記録";
    }
    else return @"Error";
}

@end
/*
 
 - (NSString*)  :(NSString*) lang
 {
 if ([lang compare:@"en_GB"] == NSOrderedSame || [lang compare:@"en-AU"] == NSOrderedSame || [lang compare:@"en_US"] == NSOrderedSame)
 {
 return  @"";
 }
 
 else if ([lang compare:@"fr_FR"] == NSOrderedSame)
 {
 return @"";
 
 }
 else if ([lang compare:@"it_IT"] == NSOrderedSame)
 {
 return @"";
 }
 else if ([lang compare:@"de_DE"] == NSOrderedSame)
 {
 return@"";
 }
 else if ([lang compare:@"es_ES"] == NSOrderedSame)
 {
 return @"";
 }
 else if ([lang compare:@"cn_MA"] == NSOrderedSame)
 {
 return @"";
 }
 else if ([lang compare:@"ja_JP"] == NSOrderedSame)
 {
 return  @"";
 }
 else return @"Error";
 }
 
 
 */
