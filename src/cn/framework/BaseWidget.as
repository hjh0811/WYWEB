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
import mx.modules.Module;

/**
 * BaseWidget精简，源于FlexViewer.
 */
public class BaseWidget extends Module implements IBaseWidget
{
    public function BaseWidget()
    {
        this.autoLayout = true;
    }
    private var _map:Map;
    private var _widgetIcon:String = "assets/images/i_widget.png";
    private var _widgetTitle:String = "";
    [Bindable]
    private var _widgetId:Number;


    [Bindable]
    public function get map():Map
    {
        return _map;
    }

    public function set map(value:Map):void
    {
        _map = value;
    }

    public function get widgetId():Number
    {
        return _widgetId;
    }

    public function set widgetId(value:Number):void
    {
        _widgetId = value;
    }

    public function get widgetTitle():String
    {
        return _widgetTitle;
    }

    public function set widgetTitle(value:String):void
    {
        _widgetTitle = value;
    }

    public function get widgetIcon():String
    {
        return _widgetIcon;
    }

    public function set widgetIcon(value:String):void
    {
        _widgetIcon = value;
    }

}

}
