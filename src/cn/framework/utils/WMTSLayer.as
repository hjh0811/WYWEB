package cn.framework.utils 
{

import com.esri.ags.SpatialReference;
import com.esri.ags.Units;
import com.esri.ags.geometry.Extent;
import com.esri.ags.geometry.MapPoint;
import com.esri.ags.layers.TiledMapServiceLayer;
import com.esri.ags.layers.supportClasses.LOD;
import com.esri.ags.layers.supportClasses.TileInfo;

import flash.net.URLRequest;

/**
 * WMTSLayer
 */
public class WMTSLayer extends TiledMapServiceLayer
{
    public function WMTSLayer()
    {
        super();

    }
	

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    private var _baseURL:String = "http://218.15.41.59:8719/wmts/sg_gz_map/Default/epsg:4610/";
//      private var _baseURL:String = "http://218.15.41.59:8719/wmts/sg_gz_image_zj/Default/epsg:4610/";
//    private var _baseURL:String = "http://172.30.242.178:8719/newmapserver4/ogc/gzdt/wmts";
//    private var _baseURL:String = "http://172.30.242.178:8719/Default/4610/";
	  
	  public function set baseUrl(value:String):void
	  {
		  _baseURL=value;
		  
		  buildTileInfo(); // to create hardcoded tileInfo
		  
		  setLoaded(true); // Map will only use loaded layers
	  }

    //--------------------------------------------------------------------------
    //
    //  Overridden properties
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  fullExtent
    //----------------------------------

    private var _fullExtent:Extent = new Extent(
		-180,-90,180,90,
        new SpatialReference(4610));

    /**
     * @private
     */
    override public function get fullExtent():Extent
    {
        return _fullExtent;
    }

    //----------------------------------
    //  initialExtent
    //----------------------------------

    private var _initialExtent:Extent = new Extent(
		112.8466,23.8896, 114.7442,25.5194,
        new SpatialReference(4610));

    /**
     * @private
     */
    override public function get initialExtent():Extent
    {
        return _initialExtent;
    }

    //----------------------------------
    //  spatialReference
    //----------------------------------

    private var _spatialReference:SpatialReference = new SpatialReference(4610);

    /**
     * Returns a SpatialReference with a wkid value of 3857.
     */
    override public function get spatialReference():SpatialReference
    {
        return _spatialReference;
    }

    //----------------------------------
    //  tileInfo
    //----------------------------------

    private var _tileInfo:TileInfo = new TileInfo();

    /**
     * @private
     */
    override public function get tileInfo():TileInfo
    {
        return _tileInfo;
    }

    //----------------------------------
    //  units
    //----------------------------------

    /**
     * Returns Units.METERS
     */
//    override public function get units():String
//    {
//        return Units.METERS;
//    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

	/**
	 * @param level  级别
	 * @param row    行
	 * @param col    列
	 * @return URLRequest
	 */
    override protected function getTileURL(level:Number, row:Number, col:Number):URLRequest
    {
//        var url:String = _baseURL
//            + "?SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile" + "&LAYER=gzdt" + "&STYLE=Default" + "&FORMAT=image/png" + "&TILEMATRIXSET=TileMatrixSet_0"
//            + "&TILEMATRIX=" + (level-9)
//            + "&TILEROW=" + row
//            + "&TILECOL=" + col;
        var url:String = _baseURL
            + "" + level
            + "/" + row
            + "/" + col + ".png";
        return new URLRequest(url);
    }

    //--------------------------------------------------------------------------
    //
    //  Private Methods
    //
    //--------------------------------------------------------------------------

    private function buildTileInfo():void
    {
        _tileInfo.dpi = 90.71428571427429;
        _tileInfo.spatialReference = new SpatialReference(4610);
        _tileInfo.height = 256;
        _tileInfo.width = 256;
        _tileInfo.format = "image/png";
        _tileInfo.origin = new MapPoint(-180, 90);
		_tileInfo.lods =
			            [
		new LOD(8, 0.0054931640625, 2311166.84),
//		new LOD(9, 305.748113140558/111194.872221777, 1155583.9160156),
		//之前服务器有一个空白的级别，后来服务重启过，重启后该WMTS服务配置没有了那个空白级别，注释掉， 后面的ID：9、10、11等重新命名
//		new LOD(11, 152.874056570411/111194.872221777, 577791.95800781),  
		new LOD(11, 0.0006866455078125, 288895.97900391),
//		new LOD(11, 38.2185141425366/111194.872221777, 144447.98950195),
//		new LOD(12, 19.1092570712683/111194.872221777, 72223.994750977),
		new LOD(12, 0.00034332275390625, 144447.93),
//		new LOD(14, 4.77731426794937/111194.872221777, 18055.998687744),
//		new LOD(15, 2.38865713397468/111194.872221777, 9027.9993438721),
		new LOD(15, 0.00004291534423828125, 18055.99),
		new LOD(16, 0.00002145767211914062, 9028),
		new LOD(17, 0.00001072883605957031, 4514),
		new LOD(18, 0.000005364418029785155, 2257),
		new LOD(19, 0.0000026822090148925775, 1128.5),
		new LOD(20, 0.00000134110450744628875, 564.25)
						];
		/*
		*原来的方式
	    */
//        _tileInfo.lods =
//            [
//            new LOD(9, 305.748113140558/111194.872221777, 1155583.9160156),
//            new LOD(10, 152.874056570411/111194.872221777, 577791.95800781),
//            new LOD(11, 76.4370282850732/111194.872221777, 288895.97900391),
//            new LOD(12, 38.2185141425366/111194.872221777, 144447.98950195),
//            new LOD(13, 19.1092570712683/111194.872221777, 72223.994750977),
//            new LOD(14, 9.55462853563415/111194.872221777, 36111.997375488),
//            new LOD(15, 4.77731426794937/111194.872221777, 18055.998687744),
//            new LOD(16, 2.38865713397468/111194.872221777, 9027.9993438721),
//            new LOD(17, 1.19432856685505/111194.872221777, 4513.999671936),
//            new LOD(18, 0.597164283559817/111194.872221777, 2256.999835968),
//            ];
	}
}
}
