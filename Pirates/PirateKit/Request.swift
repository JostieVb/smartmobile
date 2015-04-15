//
//  Request.swift
//  Pirates
//
//  Created by Joost van Bergen on 10/04/2015.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit

/// A protocol that Request uses to inform its delegate of state change
public protocol RequestDelegate
{
	/**
		Function for handling JSON response.
		
		:param: json The JSON to handle.
		:param: request The request that was sent.
		:param: params The params added to the request.
	*/
	func handleJSON(json: NSArray)
	
	func handleError(error: NSError)
}

/// Used to send webrequests.
public class Request
{
	/// The delegate of the request.
	var delegate: RequestDelegate!
	
	/// The basestring of the request.
	var baseString: String!
	
	public init(delegate: RequestDelegate)
	{
		self.delegate = delegate
		self.baseString = "http://athena.fhict.nl/users/i886625/"
	}
	
	/**
		Makes sure a GET-request gets executed.
		
		:param: request The request to get.
		:param: params The params to add.
	*/
	public func get(request requestString: String, withParams params: [String: String])
	{
		self.doRequest("GET", request: requestString, withParams: params)
	}
	
	/**
		Makes sure a POST-request gets executed.
		
		:param: request The request to post.
		:param: params The params to add.
	*/
	public func post(request requestString: String, withParams params: [String: String])
	{
		self.doRequest("POST", request: requestString, withParams: params)
	}
	
	/**
		Does a request on the server.
		
		:param: method The request-method to use.
		:param: request The request to do.
		:param: params The parameters to add.
	*/
	func doRequest(method: String, request requestString: String, withParams params: [String: String])
	{
		let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
		
		let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
		
		var URL = NSURL(string: "\(self.baseString + requestString)")
		
		URL = self.NSURLByAppendingQueryParameters(URL, queryParameters: params)
		let request = NSMutableURLRequest(URL: URL!)
		request.HTTPMethod = method
		
		let task = session.dataTaskWithRequest(request, completionHandler:
		{
			(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
			if(error != nil)
			{
				// If there is an error in the web request, print it to the console.
				println("Request error: \(error.localizedDescription)")
				
				dispatch_async(dispatch_get_main_queue(), {
					self.delegate!.handleError(error)
				})
				
				return
			}
			
			var err: NSError?
			
			var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as? NSArray
			
			if(err != nil)
			{
				// If there is an error parsing JSON, print it to the console.
				println("JSON Error: \(err!.localizedDescription)")
				
				dispatch_async(dispatch_get_main_queue(), {
					self.delegate!.handleError(err!)
				})
				
				return
			}
			
			if let result = jsonResult
			{
				dispatch_async(dispatch_get_main_queue(), {
					self.delegate!.handleJSON(result)
				})
			}
		})
		
		task.resume()
	}
	
	/**
		This creates a new query parameters string from the given NSDictionary.
		
		:param: queryParameters The input dictionary.
		
		:returns: The created parameters string.
	*/
	func stringFromQueryParameters(queryParameters : [String: String]) -> String
	{
		var parts: [String] = []
		for (name, value) in queryParameters
		{
			var part = NSString(format: "%@=%@",
				name.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!,
				value.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
			parts.append(part)
		}
		
		return "&".join(parts)
	}
	
	/**
		Creates a new URL by adding the given query parameters.
		
		:param: URL The input URL.
		:param: queryParameters The query parameter dictionary to add.
		
		:returns: A new NSURL.
	*/
	func NSURLByAppendingQueryParameters(URL : NSURL!, queryParameters : [String: String]) -> NSURL
	{
		let URLString : NSString = NSString(format: "%@?%@", URL.absoluteString!, self.stringFromQueryParameters(queryParameters))
		
		return NSURL(string: URLString)!
	}
}