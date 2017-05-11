//
//  JPSBinaryDataLoader.swift
//  Created by Jonathan Sullivan on 4/27/17.
//

import Foundation

public class JPSBinaryDataLoader
{
<<<<<<< HEAD
    enum JPSBinaryDataLoaderError : Error {
        case RuntimeError(String)
    }
    
    public class func inputStream(forResource resource: String, ofType type: String) throws -> InputStream
=======
    public class func inputStream(forResource resource: String, ofType type: String) -> InputStream
>>>>>>> 7b28c9143b658c5d5fc1a753ac0d2c7b894194ed
    {
        let resourcePath = Bundle.main.path(forResource: resource, ofType: type)
        
        guard let path = resourcePath else {
            throw JPSBinaryDataLoaderError.RuntimeError("\(resource).\(type) not found.")
        }
        
        return InputStream(fileAtPath: path)!
    }
    
<<<<<<< HEAD
    public class func data(forInputStream inputStream: InputStream, bufferSize: Int) -> Data
=======
    public class func data(forInputStream inputStream: InputStream, bufferSize: Int) -> NSData
>>>>>>> 7b28c9143b658c5d5fc1a753ac0d2c7b894194ed
    {
        var buffer = [UInt8](repeating: 0, count: bufferSize)
        
        let outputStream = OutputStream(toMemory: ())
        outputStream.schedule(in: RunLoop.current, forMode: .defaultRunLoopMode)
        outputStream.open()

        var read = inputStream.read(&buffer, maxLength: buffer.count)
        
        while (inputStream.hasBytesAvailable)
        {
            outputStream.write(&buffer, maxLength: read)
            read = inputStream.read(&buffer, maxLength: buffer.count)
        }
        
        let data = outputStream.property(forKey: Stream.PropertyKey.dataWrittenToMemoryStreamKey)
        outputStream.close()
        outputStream.remove(from: RunLoop.current, forMode: .defaultRunLoopMode)
        
        return (data as! Data)
    }
    
<<<<<<< HEAD
    public class func data(forResource resource: String, ofType type: String, bufferSize: Int) throws -> Data
=======
    public class func data(forResource resource: String, ofType type: String, bufferSize: Int) -> NSData
>>>>>>> 7b28c9143b658c5d5fc1a753ac0d2c7b894194ed
    {
        let inputStream = try JPSBinaryDataLoader.inputStream(forResource: resource, ofType: type)
        
        inputStream.schedule(in: RunLoop.current, forMode: .defaultRunLoopMode)
        inputStream.open()
        
        let data = JPSBinaryDataLoader.data(forInputStream: inputStream, bufferSize: bufferSize)
        inputStream.close()
        inputStream.remove(from: RunLoop.current, forMode: .defaultRunLoopMode)
        
        return data
    }
    
<<<<<<< HEAD
    public class func load(resource: String, ofType type: String, bufferSize: Int, numberOfItems: Int, dataOffset: Int, dataSize: Int) throws -> [Data]
=======
    public class func load(resource: String, ofType type: String, bufferSize: Int, numberOfItems: Int, dataOffset: Int, dataSize: Int) -> [Data]
>>>>>>> 7b28c9143b658c5d5fc1a753ac0d2c7b894194ed
    {
        let data = try JPSBinaryDataLoader.data(forResource: resource, ofType: type, bufferSize: bufferSize)
        
        var items = [Data]()
        
        for i in 0..<numberOfItems
        {
            let dataRange = Range(uncheckedBounds: (dataOffset + (dataSize * Int(i)), dataSize))
            let data = data.subdata(in: dataRange)
            items.append(data)
        }
        
        return items
    }
}
