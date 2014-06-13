///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2010-2011 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////
package cn.framework
{

import com.esri.ags.Map;

import flash.events.IEventDispatcher;

/**
 * IBaseWidget 源于FlexViewer，精简部分接口，只保留通用的
 */
public interface IBaseWidget extends IEventDispatcher
{
    function set widgetId(value:Number):void;
    function get widgetId():Number;
    function set widgetTitle(value:String):void;
    function get widgetTitle():String;
    function set widgetIcon(value:String):void;
    function get widgetIcon():String;
    function set map(value:Map):void;
    function get map():Map;

}

}
