//
//  ParseMacros.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 12/25/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#ifndef ParseHelpers_ParseMacros_h
#define ParseHelpers_ParseMacros_h

#define isParseObjectReady(object) ([object isKindOfClass:[PFObject class]] && [(PFObject *)object isDataAvailable])

#define isParseObjectOfClassReady(object, className) (isParseObjectReady(object) && [((PFObject *)object).parseClassName isEqualToString:className])

#endif
