//
//  Applogger.swift
//  MyCatalogue
//
//  Created by anoopm on 20/08/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import Foundation

class Applicationlogger {
    
    class func Applog (_ message:String){
        
        let messageToLog:String = message
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let logPath = (documentsPath as NSString).appendingPathComponent("application.log")
        print(logPath)
        // Check if file already exists at the log path
        let isFileAvaialble = FileManager.default.fileExists(atPath: logPath)
        
        if(isFileAvaialble){
            var fileSize:UInt64 = 0
            do {
                let attr : NSDictionary? = try FileManager.default.attributesOfItem(atPath: logPath) as NSDictionary?
                
                if let _attr = attr {
                    fileSize = _attr.fileSize();
                }
            } catch {
                print("Error: \(error)")
            }
            
            fileSize = fileSize/1024
            // If file size is more than 4mb then back it up
            if(fileSize > 4000){
                
                let backupLogPath = (documentsPath as NSString).appendingPathComponent("application.log.bak")
                // Check if file already exists at the log path
                let isFileAvaialble = FileManager.default.fileExists(atPath: backupLogPath)
                // If backup already exists then remove and move the current log as back up, we keep only 1 back up and 1 current log
                if(isFileAvaialble){
                    
                    do{
                        try FileManager.default.removeItem(atPath: backupLogPath)
                        
                        do{
                            try FileManager.default.moveItem(atPath: logPath, toPath: backupLogPath)
                        }catch let error as NSError{
                            print("Error: \(error)")
                        }
                    }catch let error as NSError{
                        
                        print("Error: \(error)")
                    }

                }
            }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let time = dateFormatter.string(from: Date())
        
        let messageToWrite = "[\(time)]:\(messageToLog)"
        
        let fileHandle:FileHandle? = FileHandle.init(forWritingAtPath: logPath)
        
        if let handler = fileHandle{
            
            handler.seekToEndOfFile()
            let space = "\n"
            handler.write(space.data(using: String.Encoding.utf8)!)
            handler.write(messageToWrite.data(using: String.Encoding.utf8)!)
            handler.closeFile()

        }else{
            
            do{
                try messageToWrite.write(toFile: logPath, atomically: false, encoding: String.Encoding.utf8)
            }catch let error as NSError{
                
                print("Error: \(error)")
            }
        }
        
    }
}
