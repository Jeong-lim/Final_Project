package com.mycompany.webapp.travel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.melong.myapp.song.model.AlbumVO2;
import com.melong.myapp.song.model.ArtistVO2;
import com.melong.myapp.song.model.ProducingVO2;
import com.melong.myapp.song.model.SongFileVO;
import com.melong.myapp.song.model.SongVO;
import com.mycompany.webapp.travel.service.TravelService;

@Controller
public class TravelController {

	@Autowired
	private TravelService travelService;

	@RequestMapping("/travel/detail")
	public String place() {
		System.out.println("check");
		return "travel/traveldetail";
	}

	@RequestMapping("/travel/insert")
	public String travelInsert() {
		return "travel/travelinsert";
	}

	@RequestMapping("/travel/list")
	public String travelList() {
		return "travel/travellist";
	}
	
	//전체 최신 차트
		@RequestMapping(value="/place/list", method=RequestMethod.GET)
		public String placeModalList(Model model) {

			List<PlaceVO> ListOfTheLatestSongs = songService.selectSongListOnTheLatestSongChart();

			List<SongFileVO> AlbumImageListOnTheLatestSongChart = songService.selectAlbumImageListOnTheLatestSongChart();

			List<SongFileVO> SongFileListOnTheLatestSongChart = songService.selectSongFileListOnTheLatestSongChart();

			List<AlbumVO2> AlbumListOnTheLatestSongChart = songService.selectAlbumListOnTheLatestSongChart();

			List<ArtistVO2> ArtistListOnTheLatestSongChart = songService.selectArtistListOnTheLatestSongChart();

			List<ProducingVO2> ProducingListOnTheLatestSongChart = songService.selectProducingListOnTheLatestSongChart();
		
			model.addAttribute("ListOfTheLatestSongs",ListOfTheLatestSongs);
			model.addAttribute("AlbumImageListOnTheLatestSongChart",AlbumImageListOnTheLatestSongChart);
			model.addAttribute("SongFileListOnTheLatestSongChart",SongFileListOnTheLatestSongChart);
			model.addAttribute("AlbumListOnTheLatestSongChart",AlbumListOnTheLatestSongChart);
			model.addAttribute("ArtistListOnTheLatestSongChart",ArtistListOnTheLatestSongChart);
			model.addAttribute("ProducingListOnTheLatestSongChart",ProducingListOnTheLatestSongChart);
			return "/song/ListOfTheLatestSongs";
		}

}
