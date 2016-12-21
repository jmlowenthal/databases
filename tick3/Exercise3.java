import uk.ac.cam.cl.databases.moviedb.MovieDB;
import uk.ac.cam.cl.databases.moviedb.model.*;

import java.util.*;

public class Exercise3 {
	public static void main(String[] args) {
		try (MovieDB database = MovieDB.open(args[0])) {
			int pos = Integer.parseInt(args[1]);
			
			for (Movie movie : database.getByTitlePrefix("")) {
				ArrayList<String> actors = new ArrayList<String>();
				for (CreditActor actor : movie.getActors()) {
					try {
						if (actor.getPosition() == pos) {
							actors.add(actor.getName());
						}
						else if (actor.getPosition() > pos) break; // Ordered by position
					}
					catch (NullPointerException e) {
						break;
					}
				}
				
				if (actors.size() > 1) {
					System.out.format("%s both have position %d in %s%n",
						String.join(" and ", actors), pos, movie.getTitle()
					); 
				}
			}
		}
	}
}